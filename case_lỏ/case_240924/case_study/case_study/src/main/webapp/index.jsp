<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome để sử dụng biểu tượng -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="css/home.css">
    <style>

    </style>

</head>
<body>
<section class="vh-100">
    <div class="container py-5 h-100">
        <div class="row d-flex align-items-center justify-content-center h-100">
            <div class="col-md-8 col-lg-7 col-xl-6">
                <img src="https://png.pngtree.com/png-clipart/20230512/original/pngtree-hacker-with-a-laptop-hacking-using-mask-png-image_9158513.png"
                     class="img-fluid" alt="Phone image">
            </div>
            <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                <h1 class="text-center" >Login Server</h1>
                <c:if test="${param.error == 'true'}">
                    <div id="error-alert" class="alert alert-danger" role="alert">
                        <strong>Error !</strong> Username or password is incorrect..
                    </div>
                </c:if>
                <form action="login-servlet" method="post">
                    <!-- Email input with placeholder and animation -->
                    <div class="form-outline mb-4">
                        <input type="text" id="username" name="username" class="form-control form-control-lg" placeholder=" " required />
                        <label class="form-label" for="username">Username</label>
                    </div>

                    <!-- Password input with placeholder and animation -->
                    <div class="form-outline mb-4">
                        <input type="password" id="password" name="password" class="form-control form-control-lg" placeholder=" " required />
                        <label class="form-label" for="password">Password</label>
                    </div>

                    <div class="d-flex justify-content-around align-items-center mb-4">
                        <!-- Checkbox -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="form1Example3" checked />
                            <label class="form-check-label" for="form1Example3" style="color: black;"> Remember me </label>
                        </div>
                        <a href="forgot.jsp" style="color: black;font-weight: bold">Forgot password?</a>
                    </div>

                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Login</button>

                    <div class="divider d-flex align-items-center my-4">
                        <p class="text-center fw-bold mx-3 mb-0 text-muted" style="color: white;font-weight: bold">OR</p>
                    </div>

                    <!-- Social login buttons -->
                    <a class="btn btn-danger btn-lg btn-block" href="gg.jsp" role="button">
                        <i class="fab fa-google"></i>Continue with Google
                    </a>
                    <a class="btn btn-primary btn-lg btn-block" style="background-color: #3b5998" href="fb.jsp" role="button">
                        <i class="fab fa-facebook-f"></i>Continue with Facebook
                    </a>
                    <a class="btn btn-info btn-lg btn-block" style="background-color: #55acee" href="tw.jsp" role="button">
                        <i class="fab fa-twitter"></i>Continue with Twitter
                    </a>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var errorAlert = document.getElementById('error-alert');
        if (errorAlert) {
            errorAlert.style.display = 'block'; // Hiển thị thông báo lỗi
            setTimeout(function () {
                errorAlert.style.opacity = 0; // Tạo hiệu ứng mờ dần
                setTimeout(function () {
                    errorAlert.style.display = 'none'; // Ẩn thông báo lỗi hoàn toàn
                }, 1000); // Thời gian cho hiệu ứng mờ dần
            }, 1000); // Thời gian hiển thị thông báo lỗi
        }
    });
</script>
</body>
</html>
