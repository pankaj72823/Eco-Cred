import cron from 'node-cron'
import Challenge from '../Models/Challange.js';
import User from '../Models/User.js';
import wrapAsync from '../Utils/wrapAsync.js';

const updateChallengeStatuses = wrapAsync(async()=>{
    const now = new Date();
    const challenges = await Challenge.find({
        status: 'ongoing',
        completion_on: { $lte: now }
      });
    
      for (const challenge of challenges) {
        await Challenge.updateOne(
          { _id: challenge._id },
          { $set: { status: 'completed' } }
        );
        const user = await User.findById(challenge.userId);

      if (user) {
        const categoryLevels = user.levels[challenge.difficult];
        if (categoryLevels < 3) {
          user.levels[challenge.difficult] = categoryLevels + 1;
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