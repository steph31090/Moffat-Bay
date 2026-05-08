<!-- Alpha Team
     Created by: Reed Bunnell -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>About Us - Moffat Bay Lodge</title>

    <link rel="stylesheet" href="css/style.css">

    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background-color: var(--light-bg);
        }

        h1 {
            text-align: center;
            margin-top: 120px;
            margin-bottom: 40px;
            color: var(--text);
        }

        .section {
            max-width: 1000px;
            margin: 0 auto 30px auto;
            background: #fff;
            padding: 25px 30px;
            border-radius: var(--radius-md);
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
        }

        .section h2 {
            margin-bottom: 12px;
            color: var(--text);
        }

        .section p {
            margin-bottom: 12px;
        }

        .section ul {
            margin-top: 10px;
            padding-left: 20px;
        }

        .section ul li {
            list-style: disc;
            margin-bottom: 8px;
            color: var(--muted);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        form label {
            font-weight: 600;
            margin-top: 10px;
            margin-bottom: 5px;
        }

        form input, form textarea {
            padding: 10px;
            border: 1px solid var(--border);
            border-radius: var(--radius-sm);
            font-family: inherit;
        }

        form input:focus, form textarea:focus {
            outline: none;
            border-color: var(--brand);
            background: #fff;
        }

        form input[type="submit"] {
            margin-top: 15px;
            background: var(--brand);
            color: #fff;
            border: none;
            cursor: pointer;
            transition: var(--transition);
        }

        form input[type="submit"]:hover {
            background: var(--brand-dark);
        }
    </style>
</head>

<body>

<%@ include file="components/header.jsp" %>

<h1>About Moffat Bay Lodge</h1>

<div class="section">
    <h2>Our Story</h2>
    <p>
        Moffat Bay Lodge is a scenic coastal retreat located on Joviedsa Island.
        What began as a small fishing lodge has grown into a full-service destination
        for travelers seeking nature, relaxation, and adventure.
    </p>
    <p>
        Surrounded by ocean views, forest trails, and rich wildlife, the lodge offers
        a peaceful escape from everyday life while maintaining modern comfort and service.
    </p>
</div>

<div class="section">
    <h2>Our Experience</h2>
    <p>
        We focus on creating meaningful guest experiences that combine outdoor adventure
        with comfortable lodging. Every stay is designed to feel personal, relaxing, and memorable.
    </p>
</div>

<div class="section">
    <h2>What We Offer</h2>
    <ul>
        <li>Whale watching and marine wildlife tours</li>
        <li>Kayaking and paddleboard rentals</li>
        <li>Guided hiking and island exploration</li>
        <li>Full-service marina and boat access</li>
        <li>Waterfront lodging with scenic views</li>
        <li>Fresh local seafood dining</li>
    </ul>
</div>

<div class="section">
    <h2>Our Mission</h2>
    <p>
        Our mission is to provide a balance of adventure, comfort, and sustainability.
        We aim to preserve the natural environment while offering guests an unforgettable coastal experience.
    </p>
</div>

<div class="section">
    <h2>Contact Us</h2>

    <form action="contactProcess.jsp" method="post">
        <label>Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Message</label>
        <textarea name="message" rows="5" required></textarea>

        <input type="submit" value="Send Message">
    </form>
</div>

</body>
</html>