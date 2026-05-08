<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Attractions - Moffat Bay Lodge</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Additional CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/fontawesome.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/styles.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/animate.css">

</head>

<body>

    <!-- Header -->
    <%@ include file="components/header.jsp" %>

    <!-- Attractions Page Content -->
    <div class="container mt-5 mb-5">

        <!-- Page Title -->
        <div class="text-center mb-5">

            <h1 class="fw-bold">
                Explore Local Attractions
            </h1>

            <p class="lead">
                Discover exciting adventures and scenic destinations near Moffat Bay Lodge.
            </p>

        </div>

        <!-- Attractions Row -->
        <div class="row">

            <!-- Attraction 1 -->
            <div class="col-md-4 mb-4">

                <div class="card h-100 shadow-sm">

                    <img src="${pageContext.request.contextPath}/images/kayaking.jpg"
                         class="card-img-top"
                         alt="Ocean Kayaking">

                    <div class="card-body">

                        <h4 class="card-title">
                            Ocean Kayaking
                        </h4>

                        <p class="card-text">
                            Experience guided kayaking tours through beautiful coastal waters
                            and wildlife areas surrounding Moffat Bay.
                        </p>

                    </div>

                </div>

            </div>

            <!-- Attraction 2 -->
            <div class="col-md-4 mb-4">

                <div class="card h-100 shadow-sm">

                    <img src="${pageContext.request.contextPath}/images/hiking.jpg"
                         class="card-img-top"
                         alt="Forest Hiking">

                    <div class="card-body">

                        <h4 class="card-title">
                            Forest Hiking Trails
                        </h4>

                        <p class="card-text">
                            Explore scenic hiking trails filled with breathtaking forest views,
                            wildlife, and relaxing outdoor experiences.
                        </p>

                    </div>

                </div>

            </div>

            <!-- Attraction 3 -->
            <div class="col-md-4 mb-4">

                <div class="card h-100 shadow-sm">

                    <img src="${pageContext.request.contextPath}/images/fishing.jpg"
                         class="card-img-top"
                         alt="Fishing Tours">

                    <div class="card-body">

                        <h4 class="card-title">
                            Fishing Excursions
                        </h4>

                        <p class="card-text">
                            Enjoy unforgettable fishing adventures with local guides and scenic
                            coastal views around the bay.
                        </p>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <!-- Footer -->
    <%@ include file="components/footer.jsp" %>

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>

    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/custom.js"></script>

</body>

</html>