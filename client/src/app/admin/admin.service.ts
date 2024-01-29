import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ProductCreate } from '../shared/models/productCreate';

@Injectable({
  providedIn: 'root',
})
export class AdminService {
  baseUrl = 'http://localhost:5002/api/';

  constructor(private http: HttpClient) {}

  UpdateProduct(id: number, product: ProductCreate) {
    return this.http.put<ProductCreate>(this.baseUrl + 'products/' + id, product);
  }

  deleteProduct(id: number) {
    return this.http.delete(this.baseUrl + 'products/' + id);
  }

  addProduct(productCreate: ProductCreate) {
    return this.http.post<ProductCreate>(this.baseUrl + 'products', productCreate);
  }

  getMostOrderedProducts(month: number, year: number) {
    const url = `${this.baseUrl}orders/most-ordered-products/${month}/${year}`;
    return this.http.get<string[]>(url);
  }

}
