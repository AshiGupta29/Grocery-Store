export interface OrderItem {
  productId: number;
  productName: string;
  imageUrl: string;
  price: number;
  quantity: number;
  discount: number;
}

export interface OrderToCreate {
    basketId: string; 
}

export interface Order {
  id: number
  buyerEmail: string
  orderdate: string
  orderItems: OrderItem[]
  total: number
}