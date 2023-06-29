<%-- 
    Document   : viewOrder
    Created on : Oct 17, 2021, 9:26:40 PM
    Author     : Phước Hà
--%>


<%-- 
    Document   : viewCart
    Created on : Oct 17, 2021, 2:12:23 AM
    Author     : Phước Hà
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>View Order</title>
        <jsp:include page="components/head.jsp"></jsp:include>
            <style>
                .table-container {
                    width: 100%; /* Set the desired width for the scrollable area */
                    overflow-x: auto; /* Enable horizontal scrolling */
                }

                .table-container table {
                    width: max-content; /* Expand the table to accommodate all columns */
                }
            </style>
        </head>
        <body>
        <jsp:include page="components/header.jsp"></jsp:include>   
            <!-- Room Details Section Begin -->
            <section class="room-details-section spad">
                <c:if test="${sessionScope.ACC.roleId == 1}">
                <h2 style="text-align: center;">REVENUE MANAGEMENT</h2>
                </c:if>
                <c:if test="${sessionScope.ACC.roleId == 2}">
                <h2 style="text-align: center;">VIEW MY ORDER</h2>
                </c:if>
                <c:if test="${sessionScope.ACC.roleId == 3}">
                <h2 style="text-align: center;">LIST ALL ORDER</h2>
                </c:if>
                <div class="container mt-10 mb-10">

                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                <c:if test="${requestScope.CART_MSG != null}">
                                    <p class="right" style="color: #000">${requestScope.CART_MSG}</p>
                                </c:if>
                                <c:if test="${requestScope.CHECKDISCOUNT_MSG != null}">
                                    <p class="right">${requestScope.CHECKDISCOUNT_MSG}</p>
                                </c:if>
                                <div class="table">
                                    <c:if test="${requestScope.LIST_ORDERDETAILS != null}">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <th>No.</th>
                                                <th>HotelName</th>
                                                <th>RoomName</th>
                                                <th>Quantity</th>
                                                <th>Night</th>
                                                <th>CheckIn</th>
                                                <th>CheckOut</th>
                                                <th>RoomPrice</th>

                                                <th>Action</th>



                                            </tr>

                                            <c:forEach var="o" items="${requestScope.LIST_ORDERDETAILS}" varStatus="count">
                                                <form action="MainController">
                                                    <tr>
                                                        <td>${count.count}</td>
                                                        <td><h3><a href="#">${o.hotelName}</a></h3></td>
                                                        <td>${o.roomName}</td>

                                                        <td>${o.orderQuantity}</td> 
                                                        <td>${o.night}</td>
                                                        <td>${o.checkIn} </td>
                                                        <td>${o.checkOut}</td>
                                                        <td>${o.roomPrice} .vnđ</td>
                                                        <c:if test="${sessionScope.ACC.roleId == 2}">
                                                            <td>
                                                                <a href="MainController?btnAction=feedBackPage&roomNo=${o.roomNo}&orderId=${o.orderId}" class="ico edit">FeedBack</a>
                                                            </td>
                                                        </c:if>
                                                        <c:if test="${sessionScope.ACC.roleId == 1}">
                                                            <td>
                                                                <a href="loadorderbystatus" class="ico edit">Back</a>
                                                            </td>
                                                        </c:if>
                                                        <c:if test="${sessionScope.ACC.roleId == 3}">
                                                            <td>
                                                                <a href="loadallorder" class="ico edit">Back</a>
                                                            </td>
                                                        </c:if>



                                                    </tr>
                                                </form>
                                            </c:forEach>


                                        </table>
                                    </c:if>


                                    <div class="col-12" style="margin-left: 400px!important; margin-top: 50px;">
                                        <div class="row">
                                            <h3>The Booked Services</h3>

                                        </div>
                                        <div class="row">
                                            <c:if test="${requestScope.services != null}">
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Name</th>
                                                            <th>Price</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach varStatus="counter" var="service" items="${requestScope.services}">
                                                            <tr>
                                                                <td>${counter.count}</td>
                                                                <td>${service.name}</td>
                                                                <td>${service.price}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </c:if>
                                        </div>
                                    </div>


                                    <!-- Pagging -->

                                    <!-- End Pagging -->
                                </div>
                            </div>
                        </div>
                        <c:if test="${requestScope.FEEDBACK_ROOM != null}">
                            <div id="sidebar">
                                <!-- Box -->
                                <div class="box">
                                    <form action="MainController">
                                        <!-- Box Head -->
                                        <div class="box-head">
                                            <h2>Feed Back</h2>
                                        </div>

                                        <p>Feed back For RoomId = ${requestScope.FEEDBACK_ROOM}</p>

                                        <input type="hidden" name="orderId" value="${requestScope.ORDER_ID}">
                                        <input type="hidden" name="roomNo" value="${requestScope.FEEDBACK_ROOM}">
                                        <select style="width: 100%" name="value">
                                            <option value="1">1 Not Sactified</option>
                                            <option value="2">2 Star</option>
                                            <option value="3">3 Star</option>
                                            <option value="4">4 Star</option>
                                            <option value="5">5 Normal</option>
                                            <option value="6">6 Star</option>
                                            <option value="7">7 Star</option>
                                            <option value="8">8 Star</option>
                                            <option value="9">9 Star</option>
                                            <option value="10">10 Very Sactified</option>
                                        </select>
                                        <!-- Date Picker -->

                                        <!-- End Box Head-->
                                        <!-- Sort -->

                                        <!-- End Sort -->
                                        <button name="btnAction" value="FeedBackServlet" class="btn btn-primary" style="width: 100%">FeedBack</button>
                                    </form>
                                </div>

                                <!-- End Box -->
                            </div>
                        </c:if>
                    </div>
                </div>

            </div>


        </div>
    </section>
    <!-- Room Details Section End -->
    <jsp:include page="components/footer.jsp"></jsp:include>
</body>
</html>
