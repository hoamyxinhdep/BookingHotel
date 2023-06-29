<%-- 
    Document   : homeForUser.jsp
    Created on : Oct 14, 2021, 9:23:44 PM
    Author     : Phước Hà
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        <jsp:include page= "components/head.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="components/header.jsp"></jsp:include>   
            <!-- Hero Section Begin -->
            <section class="hero-section spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero-text">
                                <h1>Sona A Luxury Hotel</h1>
                                <p>Here are the best hotel booking sites, including recommendations for international
                                    travel and for finding low-priced hotel rooms.</p>
                                <a href="#" class="primary-btn">Discover Now</a>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-5 offset-xl-2 offset-lg-1">
                            <div class="booking-form">
                                <h3>Booking Your Hotel</h3>
                            <c:if test="${requestScope.SEARCH_MSG != null}">
                                <h3 class="text-danger">${requestScope.SEARCH_MSG}</h3>
                            </c:if>
                            <form action="MainController">
                                <div class="form-group">
                                   
                                    <input type="hidden" name="searchValue" class="form-control" value="${sessionScope.SEARCH_VALUE}" />
                                </div>
                                <div class="check-date">
                                    <label for="date-in">Check In:</label>
                                    <input name="checkIn" autocomplete="off" type="date" class="" id="">
                                </div>
                                <div class="check-date">
                                    <label for="date-out">Check Out:</label>
                                    <input name="checkOut" autocomplete="off"  type="date" class="" id="">
                                </div>
                                <div class="select-option">
                                    <label for="guest">Guests:</label>
                                    <select id="guest">
                                        <option value="">2 Adults</option>
                                        <option value="">3 Adults</option>
                                    </select>
                                </div>
                                <div class="select-option">
                                    <label for="room">Room:</label>
                                    <select name="avaiRoom" id="room">
                                        <option value="1">1 Room</option>
                                        <option value="2">2 Room</option>
                                    </select>
                                </div>
                                <button value="SearchHotel" name="btnAction" type="submit">Check Availability</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero-slider owl-carousel">
                <div class="hs-item set-bg" data-setbg="img/hero/hero-1.jpg"></div>
                <div class="hs-item set-bg" data-setbg="img/hero/hero-2.jpg"></div>
                <div class="hs-item set-bg" data-setbg="img/hero/hero-3.jpg"></div>
            </div>
        </section>
        <!-- Hero Section End -->   
        <!-- Home Room Section Begin -->

        <section class="hp-room-section spad">
            <h3>Your Available Room</h3>
            <div class="container-fluid">
                <!-- Home Room Section Begin -->
                <section class="hp-room-section">
                    <div class="container-fluid mt-10">
                        <div class="hp-room-items">
                            <div class="row">
                                <c:forEach var="h" items="${requestScope.LIST_ROOM}" varStatus="count">
                                    <div class="col-lg-3 col-md-6">
                                        <div class="hp-room-item set-bg" data-setbg="img/room/room-b1.jpg">
                                            <div class="hr-text">
                                                <h3>${h.roomName}</h3>
                                                <h2>${h.price}$<span>/Pernight</span></h2>
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="r-o">Size:</td>
                                                            <td>30 ft</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Capacity:</td>
                                                            <td>Max persion 5</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Bed:</td>
                                                            <td>${h.typeId} Beds</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Services:</td>
                                                            <td>Wifi, Television, Bathroom,...</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <a href="MainController?btnAction=viewDetailRoom&hotelId=${h.hotelId}&roomNo=${h.roomNo}" class="primary-btn">Order</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>  
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </section>

        <jsp:include page="components/footer.jsp"></jsp:include>
    </body>
</html>