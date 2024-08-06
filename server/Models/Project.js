import { Schema, model } from 'mongoose';

const projectSchema = new Schema({
  name: {
    type: String,
    required: true,
  },
  description: {
    type: String,
    required: true,
  },
  organization: {
    type: String,
    required: true,
  },
  project_type: [{
    type: String,
    required: true,
  }],
  impact :{
    type: String,
    required: true,
  }
})

const Project = model('Project', projectSchema);

export default Project;
