<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div>--%>
<%--    <h1>Thêm Mới Học Viên</h1>--%>
<%--    <form action="?action=create" method="post">--%>
<%--        <div>--%>
<%--            <label for="name">Tên:</label>--%>
<%--            <input type="text" id="name" name="name" value="${students.name}" required>--%>
<%--        </div>--%>

<%--        <div>--%>
<%--            <label>Giới tính:</label>--%>
<%--            <input type="radio" id="genderMale" name="gender" value="1" ${students.gender == '1' ? 'checked' : ''} required>--%>
<%--            <label for="genderMale">Nam</label>--%>
<%--            <input type="radio" id="genderFemale" name="gender" value="0" ${students.gender == '0' ? 'checked' : ''} required>--%>
<%--            <label for="genderFemale">Nữ</label>--%>
<%--        </div>--%>

<%--        <div>--%>
<%--            <label for="email">Email:</label>--%>
<%--            <input type="email" id="email" name="email" value="${students.email}" required>--%>
<%--        </div>--%>

<%--        <div>--%>
<%--            <label for="classId">Lớp học:</label>--%>
<%--            <select name="classId" id="classId" required>--%>
<%--                <option value="" disabled selected>Chọn lớp</option>--%>
<%--                <c:forEach var="c" items="${listCr}">--%>
<%--                    <option value="${c.classId}" ${c.classId == students.clazz.classId ? 'selected' : ''}>${c.className}</option>--%>

<%--                </c:forEach>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn">Lưu</button>--%>
<%--    </form>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm Mới Mặt Bằng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Thêm Mới Mặt Bằng</h2>
    <form action="MatBangServlet?action=save" method="post">
        <div class="mb-3">
            <label for="maMb" class="form-label">Mã MB</label>
            <input type="text" class="form-control" id="maMb" name="maMb" required>
        </div>
        <div class="mb-3">
            <label for="dienTich" class="form-label">Diện Tích</label>
            <input type="number" class="form-control" id="dienTich" name="dienTich" required>
        </div>
        <div class="mb-3">
            <label for="trThai" class="form-label">Trạng Thái</label>
            <select class="form-control" id="trThai" name="trThai" required>
                <option value="1">Trống</option>
                <option value="2">Hạ Tầng</option>
                <option value="3">Đầy Đủ</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="tang" class="form-label">Tầng</label>
            <input type="number" class="form-control" id="tang" name="tang" required>
        </div>
        <div class="mb-3">
            <label for="loaiVp" class="form-label">Loại Văn Phòng</label>
            <select class="form-control" id="loaiVp" name="loaiVp" required>
                <option value="1">Cho Thuê</option>
                <option value="2">Trọn Gói</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="giaThue" class="form-label">Giá Cho Thuê</label>
            <input type="number" class="form-control" id="giaThue" name="giaThue" required>
        </div>
        <div class="mb-3">
            <label for="startDate" class="form-label">Ngày Bắt Đầu</label>
            <input type="date" class="form-control" id="startDate" name="startDate" required>
        </div>
        <div class="mb-3">
            <label for="endDate" class="form-label">Ngày Kết Thúc</label>
            <input type="date" class="form-control" id="endDate" name="endDate" required>
        </div>
        <button type="submit" class="btn btn-primary">Lưu</button>
        <a href="list.jsp" class="btn btn-secondary">Quay lại</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
