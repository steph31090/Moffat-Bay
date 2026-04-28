<!-- Alpha Team
	Created by: Daniel Graham -->

<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<html lang="en">



  <head>



    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">



    <title>Welcome to Moffat Bay Lodge</title>



    <!-- CSS -->

    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	

    <link rel="stylesheet" href="css/fontawesome.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">

    <link rel="stylesheet" href="css/owl.css">

    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>



  </head>



<body>



  <!-- JS Preloader -->

  <div id="js-preloader" class="js-preloader">

    <div class="preloader-inner">

      <span class="dot"></span>

      <div class="dots">

        <span></span>

        <span></span>

        <span></span>

      </div>

    </div>

  </div>



  <!-- Header -->
  
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">

                    <!-- Logo  -->
                    <a href="index.jsp" class="logo">
                        <img src="images/Logo.jpg" alt="Moffat Bay Lodge Logo">
                    </a>

                    <!-- Menu -->
                    <ul class="nav">
                        <li><a href="index.jsp" class="active">Home</a></li>
                        <li><a href="about.jsp">About Us</a></li>
                        <li><a href="attractions.jsp">Attractions</a></li>
                        <li><a href="reservation.jsp">Book Reservation</a></li>
                        <li><a href="lookup.jsp">Reservation Lookup</a></li>
                        <%
	                        if (session.getAttribute("user") == null) {
	                    %>
	                    <li class="auth"><a class="btn-outline" href="account/login.jsp">Login</a></li>
	                    <%
	                        } else {
	                    %>
	                    <li class="auth"><a class="btn-outline" href="#">Welcome, <%= session.getAttribute("user") %></a></li>
	                    <li class="auth"><a class="btn-outline" href="account/logout.jsp">Logout</a></li>
	                    <%
	                        }
	                    %>
                    </ul>
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                </nav>
            </div>
        </div>
    </div>
  </header>



  <!-- Main Banner -->

  <section id="section-1">

    <div class="content-slider">

      <input type="radio" id="banner1" class="sec-1-input" name="banner" checked>

      <input type="radio" id="banner2" class="sec-1-input" name="banner">

      <input type="radio" id="banner3" class="sec-1-input" name="banner">

      <input type="radio" id="banner4" class="sec-1-input" name="banner">

      <div class="slider">

        <div id="top-banner-1" class="banner">

          <div class="banner-inner-wrapper header-text">

            <div class="main-caption">

              <h2>Stay with us at</h2>

              <h1>Moffat Bay Lodge</h1>

              <div class="border-button"><a href="reservation.jsp">Book a reservation</a></div>

            </div>

          </div>

        </div>

        <div id="top-banner-2" class="banner">

          <div class="banner-inner-wrapper header-text">

            <div class="main-caption">

              <h2>Hike with us at</h2>

              <h1>Moffat Bay Lodge</h1>

              <div class="border-button"><a href="reservation.jsp">Book a reservation</a></div>

            </div>

          </div>

        </div>

        <div id="top-banner-3" class="banner">

          <div class="banner-inner-wrapper header-text">

            <div class="main-caption">

              <h2>Whale Watch with us at</h2>

              <h1>Moffat Bay Lodge</h1>

              <div class="border-button"><a href="reservation.jsp">Book a reservation</a></div>

            </div>

          </div>

        </div>

        <div id="top-banner-4" class="banner">

          <div class="banner-inner-wrapper header-text">

            <div class="main-caption">

              <h2>Scuba Dive with us at</h2>

              <h1>Moffat Bay Lodge</h1>

              <div class="border-button"><a href="reservation.jsp">Book a reservation</a></div>

            </div>

          </div>

        </div>

      </div>

      <nav>

        <div class="controls">

          <label for="banner1"><span class="progressbar"><span class="progressbar-fill"></span></span><span class="text">Stay</span></label>

          <label for="banner2"><span class="progressbar"><span class="progressbar-fill"></span></span><span class="text">Hike</span></label>

          <label for="banner3"><span class="progressbar"><span class="progressbar-fill"></span></span><span class="text">Whale Watch</span></label>

          <label for="banner4"><span class="progressbar"><span class="progressbar-fill"></span></span><span class="text">Scuba Dive</span></label>

        </div>

      </nav>

    </div>

  </section>

  

  <!-- Info Section -->

  <div class="infocards">

    <div class="container">

      <div class="row">



      </div>

      <div class="row">

        <div class="col-lg-8">

          <div class="items">

            <div class="row">

              <div class="col-lg-12">

                <div class="item">

                  <div class="row">

                    <div class="col-lg-4 col-sm-5">

                      <div class="image">

                        <img src="images/country-01.jpg" alt="">

                      </div>

                    </div>

                    <div class="col-lg-8 col-sm-7">

                      <div class="right-content">

                        <div class="vctext">

                        Beautiful Stays

                        </div>

                        <span>Modern Accomodations</span>

                        <div class="main-button">

                          <a href="reservation.jsp">Book Now</a>

                        </div>

                        <p>Visit our lodge and stay with us in our newly built, modern retreat in the heart of the beautiful pacific northwest.</p>

                        <div class="text-button">

                          <a href="about.jsp">Visit our "About Us" page to learn more<i class="fa fa-arrow-right"></i></a>

                        </div>

                      </div>

                    </div>

                  </div>

                </div>

              </div>

              <div class="col-lg-12">

                <div class="item">

                  <div class="row">

                    <div class="col-lg-4 col-sm-5">

                      <div class="image">

                        <img src="images/country-02.jpg" alt="">

                      </div>

                    </div>

                    <div class="col-lg-8 col-sm-7">

                      <div class="right-content">

                        <div class="vctext">

                        Attactions

                        </div>

                        <span>Hiking, Kayaking, Whale Watching, Scuba Diving</span>

                        <div class="main-button">

                          <a href="reservation.jsp">Book Now</a>

                        </div>

                        <p>Visit our selection of scenic hikes, beautiful kayaking tours, majestic whale watching and scuba diving experiences for all ages, interests and skills.</p>



                        <div class="text-button">

                          <a href="attractions.jsp">Visit our "Attractions" page to learn more<i class="fa fa-arrow-right"></i></a>

                        </div>

                      </div>

                    </div>

                  </div>

                </div>

              </div>

              <div class="col-lg-12">

                <div class="item last-item">

                  <div class="row">

                    <div class="col-lg-4 col-sm-5">

                      <div class="image">

                        <img src="images/country-03.jpg" alt="">

                      </div>

                    </div>

                    <div class="col-lg-8 col-sm-7">

                      <div class="right-content">

                        <div class="vctext">

                        Share your Experiences!

                        </div>

                        <span>Connect With Us! #MoffatBay</span>

                        <div class="main-button">

                          <a href="reservation.jsp">Book Now</a>

                        </div>

                        <p>Visit our Social Media sites to see pictures stories and news shared by staff and guests!</p>

                        <ul class="info">

                          <li><i class="fa-brands fa-facebook"></i><a href="#">Facebook</a></li>

                          <li><i class="fa-brands fa-instagram"></i><a href="#">Instagram</a></li>

                          <li><i class="fa-brands fa-twitter"></i><a href="#">Twitter</a></li>

                        </ul>

                        <div class="text-button">

                          <a href="about.jsp">Contact Us with Questions! <i class="fa fa-arrow-right"></i></a>

                        </div>

                      </div>

                    </div>

                  </div>

                </div>

              </div>

            </div>

          </div>

        </div>

        <div class="col-lg-4">

          <div class="side-bar-map">

            <div class="row">

              <div class="col-lg-12">

                <div id="map">

				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3729.9545445599924!2d-123.16413001420244!3d48.61986978738752!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x548f63117673f035%3A0xbcde95848200f427!2sBarren%20Island!5e0!3m2!1sen!2sus!4v1776292767288!5m2!1sen!2sus" width="100%" height="750px" frameborder="1" style="border:0; border-radius: 23px; " allowfullscreen=""></iframe>

                </div>

              </div>

            </div>

          </div>

        </div>

      </div>

    </div>

  </div>



  <div class="call-to-action">

    <div class="container">

      <div class="row">

        <div class="col-lg-8">

          <h2>Ready for an escape?</h2>

          <h4>Book with us now!</h4>

        </div>

        <div class="col-lg-4">

          <div class="border-button">

            <a href="reservation.jsp">Make a reservation</a>

          </div>

        </div>

      </div>

    </div>

  </div>



  <footer>

    <div class="container">

      <div class="row">

        <div class="col-lg-12">

          <p>Copyright © 2026 Alpha Team - Stephanie, Daniel, Sylvester, Reed. All rights reserved. 

          <br>A Project for CSD460-H307: Software Development Capstone. Not a real place, sorry folks!</p>

        </div>

      </div>

    </div>

  </footer>





  <!-- Scripts -->

  <!-- Bootstrap core JavaScript -->

  <script src="vendor/jquery/jquery.min.js"></script>

  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>



  <script src="js/isotope.min.js"></script>

  <script src="js/owl-carousel.js"></script>

  <script src="js/wow.js"></script>

  <script src="js/tabs.js"></script>

  <script src="js/popup.js"></script>

  <script src="js/custom.js"></script>



  <script>

    function bannerSwitcher() {

      next = $('.sec-1-input').filter(':checked').next('.sec-1-input');

      if (next.length) next.prop('checked', true);

      else $('.sec-1-input').first().prop('checked', true);

    }



    var bannerTimer = setInterval(bannerSwitcher, 5000);



    $('nav .controls label').click(function() {

      clearInterval(bannerTimer);

      bannerTimer = setInterval(bannerSwitcher, 5000)

    });

  </script>



  </body>



</html>

