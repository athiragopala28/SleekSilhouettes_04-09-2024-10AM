<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="bean.Product"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>View Products</title>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Product List</h2>
        <%
            ProductDao productDao = new ProductDao();
            List<Product> products = productDao.getAllProducts();
        %>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Collection</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (products.isEmpty()) {
                %>
                <tr>
                    <td colspan="7" class="text-center">No products found</td>
                </tr>
                <%
                    } else {
                        for (Product product : products) {
                %>
                <tr>
                    <td><%=product.getId()%></td>
                    <td><%=product.getProductName()%></td>
                    <td><%=product.getCollectionName()%></td>
                    <td><%=product.getPrice()%></td>
                    <td><img src="<%=product.getImageUrl()%>" alt="Product Image" width="100" height="150"></td>
                    <td><%=product.getDescription()%></td>
                    <td>
                        <a href="EditProduct.jsp?id=<%=product.getId()%>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="DeleteProduct.jsp?id=<%=product.getId()%>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="7" class="text-center">
                        <a href="addproduct.jsp" class="btn btn-primary">Add New Product</a>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>

    <!-- Include Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
