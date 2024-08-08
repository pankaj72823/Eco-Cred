import { Schema, model } from 'mongoose';

const productSchema = new Schema({
  category: {
    type: String,
    required: true,
    enum: ['General Store Items', 'Cosmetics', 'Home Care Items']
  },
  brand: {
    type: String,
    required: true
  },
  product: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: true
  },
  carbon_reduce: {
    type: Number,
    required: true
  }
})

const Product = model('Product', productSchema);

export default Product;
