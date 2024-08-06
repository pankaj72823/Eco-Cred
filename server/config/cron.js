import cron from 'node-cron'
import Challenge from '../Models/Challange.js';
import User from '../Models/User.js';
import Reward from '../Models/Rewards.js'
import wrapAsync from '../Utils/wrapAsync.js';

const updateChallengeStatuses = wrapAsync(async()=>{
    const now = new Date();
    const challenges = await Challenge.find({
        status: 'ongoing',
        completion_on: { $lte: now }
      });
    
      for (const challenge of challenges) {
        await Challenge.updateMany({userId : challenge.userId, status : "blocked"},{status:"available"})
        await Challenge.updateOne(
          { _id: challenge._id },
          { $set: { status: 'completed' } }
        );
        const user = await User.findById(challenge.userId);
        
      if (user) {
        const categoryLevels = user.levels[challenge.difficulty];
        if (categoryLevels < 3) {
          user.levels[challenge.difficulty] = categoryLevels + 1;
        }
        const reward = await Reward.findOne({ difficulty:challenge.difficulty, level : user.levels[challenge.difficulty] }).exec();
        if (reward) {
          user.rewards_completed[challenge.difficulty].push(reward._id);
        }
        const nextLevel = user.levels[challenge.difficulty] + 1;
        if (nextLevel <= 3) { 
          const upcomingReward = await Reward.findOne({
            difficulty: challenge.difficulty,
            level: nextLevel
          }).exec();
          if (upcomingReward) {
            user.rewards_upcoming[challenge.difficulty]=upcomingReward._id;
          }
        }
        await user.save();
    }
    }
})
cron.schedule('* * * * *', () => {
    console.log('Checking and updating challenge statuses...');
    updateChallengeStatuses()
      .then(() => console.log('Update completed.'))
      .catch(err => console.error('Error updating statuses:', err));
  });