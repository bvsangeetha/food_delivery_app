<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="com.food.model.Menu" %>
<%@ page import="com.food.model.Restaurant" %>
<%@ page import="com.food.model.User" %>
<%
Restaurant restaurant = (Restaurant)request.getAttribute("restaurant");
User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="FoodLounge Menu - Explore our full menu. Order your favourite dishes for fast delivery." />
    <title>FoodLounge | Menu</title>

    <style>
      /* =================================
         GOOGLE FONTS IMPORT
      ================================= */
      @import url("https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap");

      /* =================================
         CSS VARIABLES & RESET
      ================================= */
      :root {
        --primary: #ef4f2f;
        --primary-hover: #d93d20;
        --primary-light: #fff1f0;
        --primary-gradient: linear-gradient(135deg, #ef4f2f 0%, #ff6b4a 100%);
        --dark-bg: #0f172a;
        --dark-surface: #1e293b;
        --text-main: #0f172a;
        --text-muted: #64748b;
        --text-light: #94a3b8;
        --bg-main: #f8fafc;
        --bg-card: #ffffff;
        --border-color: #e2e8f0;
        --success: #16a34a;
        --radius-sm: 8px;
        --radius-md: 14px;
        --radius-lg: 20px;
        --radius-xl: 28px;
        --radius-full: 9999px;
        --shadow-sm: 0 2px 8px rgba(15, 23, 42, 0.04);
        --shadow-md: 0 10px 30px rgba(15, 23, 42, 0.08);
        --shadow-lg: 0 20px 45px rgba(15, 23, 42, 0.12);
        --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
      }

      * { margin: 0; padding: 0; box-sizing: border-box; }

      html { scroll-behavior: smooth; }

      body {
        font-family: "Plus Jakarta Sans", -apple-system, BlinkMacSystemFont, sans-serif;
        background-color: var(--bg-main);
        color: var(--text-main);
        line-height: 1.6;
        -webkit-font-smoothing: antialiased;
        overflow-x: hidden;
      }

      a { text-decoration: none; color: inherit; transition: var(--transition); }
      img { max-width: 100%; height: auto; display: block; }

      ::-webkit-scrollbar { width: 8px; }
      ::-webkit-scrollbar-track { background: #f1f5f9; }
      ::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: var(--radius-full); }
      ::-webkit-scrollbar-thumb:hover { background: var(--primary); }

      /* =================================
         HEADER & NAVBAR
      ================================= */
      header {
        width: 100%;
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        position: sticky;
        top: 0;
        z-index: 1000;
        border-bottom: 1px solid rgba(226, 232, 240, 0.8);
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
      }

      .navbar {
        width: 90%;
        max-width: 1300px;
        height: 80px;
        margin: 0 auto;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 20px;
      }

      .brand-container { display: flex; align-items: center; gap: 24px; }

      .logo {
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 26px;
        font-weight: 800;
        letter-spacing: -0.5px;
        color: var(--text-main);
      }

      .logo-icon {
        width: 38px;
        height: 38px;
        background: var(--primary-gradient);
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 4px 12px rgba(239, 79, 47, 0.3);
      }

      .logo-icon svg { width: 22px; height: 22px; fill: white; }
      .logo span { color: var(--primary); }

      .nav-menu { display: flex; align-items: center; gap: 32px; }

      .nav-links {
        display: flex;
        align-items: center;
        gap: 28px;
        list-style: none;
      }

      .nav-links a {
        color: var(--text-muted);
        font-size: 15px;
        font-weight: 600;
        position: relative;
        padding: 4px 0;
      }

      .nav-links a:hover,
      .nav-links a.active { color: var(--primary); }

      .nav-links a::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        width: 0%;
        height: 2.5px;
        background: var(--primary);
        border-radius: var(--radius-full);
        transition: var(--transition);
      }

      .nav-links a:hover::after,
      .nav-links a.active::after { width: 100%; }

      .nav-plain-icon {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        color: var(--text-muted);
        font-size: 15px;
        font-weight: 600;
        position: relative;
        padding: 4px 0;
        transition: var(--transition);
      }

      .nav-plain-icon:hover { color: var(--primary); }

      .nav-plain-icon::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        width: 0%;
        height: 2.5px;
        background: var(--primary);
        border-radius: var(--radius-full);
        transition: var(--transition);
      }

      .nav-plain-icon:hover::after { width: 100%; }

      .nav-actions { display: flex; align-items: center; gap: 14px; }

      .btn-auth-ghost {
        padding: 10px 20px;
        font-size: 14px;
        font-weight: 700;
        color: var(--text-main);
        border-radius: var(--radius-full);
        transition: var(--transition);
      }

      .btn-auth-ghost:hover { color: var(--primary); background: var(--primary-light); }

      .btn-auth-solid {
        padding: 10px 22px;
        font-size: 14px;
        font-weight: 700;
        color: white;
        background: var(--primary-gradient);
        border-radius: var(--radius-full);
        box-shadow: 0 4px 14px rgba(239, 79, 47, 0.3);
        transition: var(--transition);
      }

      .btn-auth-solid:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(239, 79, 47, 0.4);
      }

      /* =================================
         SIMPLE HERO IMAGE BANNER (NO TEXT / NO ICONS)
      ================================= */
      .menu-hero-banner {
        width: 100%;
        height: 280px;
        background: url("https://images.unsplash.com/photo-1555396273-367ea4eb4db5?q=80&w=1600&auto=format&fit=crop") center / cover no-repeat;
        position: relative;
      }

      .menu-hero-banner::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 70px;
        background: linear-gradient(to bottom, transparent, var(--bg-main));
        pointer-events: none;
      }

      /* =================================
         PAGE WRAPPER
      ================================= */
      .page-wrapper {
        width: 90%;
        max-width: 1300px;
        margin: 0 auto;
        padding-bottom: 80px;
      }

      /* =================================
         RESTAURANT INFO STRIP (PIZZA PALACE)
      ================================= */
      .restaurant-strip {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: var(--radius-xl);
        padding: 22px 30px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 20px;
        flex-wrap: wrap;
        box-shadow: var(--shadow-md);
        margin-top: -48px;
        position: relative;
        z-index: 10;
        margin-bottom: 24px;
      }

      .strip-left {
        display: flex;
        align-items: center;
        gap: 18px;
      }

      .strip-logo {
        width: 68px;
        height: 68px;
        border-radius: var(--radius-md);
        overflow: hidden;
        border: 2px solid var(--border-color);
        flex-shrink: 0;
        box-shadow: var(--shadow-sm);
      }

      .strip-logo img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .strip-info h2 {
        font-size: 22px;
        font-weight: 800;
        color: var(--text-main);
        margin-bottom: 4px;
        display: flex;
        align-items: center;
        gap: 8px;
      }

      .verified-badge {
        width: 18px;
        height: 18px;
        fill: var(--primary);
      }

      .strip-meta {
        display: flex;
        align-items: center;
        gap: 14px;
        flex-wrap: wrap;
      }

      .strip-badge {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        font-size: 13px;
        font-weight: 600;
        color: var(--text-muted);
      }

      .strip-badge svg {
        width: 15px;
        height: 15px;
        stroke: var(--primary);
        stroke-width: 2.2;
        fill: none;
      }

      .strip-badge.rating-badge {
        background: var(--success);
        color: white;
        padding: 4px 10px;
        border-radius: var(--radius-sm);
        font-weight: 800;
      }

      .strip-badge.rating-badge svg {
        fill: white;
        stroke: none;
        width: 12px;
        height: 12px;
      }

      .strip-dot {
        width: 4px;
        height: 4px;
        border-radius: 50%;
        background: var(--border-color);
      }

      .open-pill {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        background: #f0fdf4;
        border: 1px solid #bbf7d0;
        border-radius: var(--radius-full);
        padding: 4px 12px;
        font-size: 12px;
        font-weight: 700;
        color: var(--success);
      }

      .live-dot {
        width: 7px;
        height: 7px;
        border-radius: 50%;
        background: var(--success);
        animation: blink 1.4s ease-in-out infinite;
      }

      @keyframes blink {
        0%, 100% { opacity: 1; }
        50% { opacity: 0.35; }
      }

      /* =================================
         PLAIN TEXT LINK: BACK TO RESTAURANTS (MILD ORANGE THEME COLOR)
      ================================= */
      .back-to-restaurants-row {
        margin-bottom: 24px;
        display: flex;
        align-items: center;
      }

      .back-text-link {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        color: var(--primary);
        font-size: 15px;
        font-weight: 700;
        text-decoration: none;
        transition: var(--transition);
        cursor: pointer;
      }

      .back-text-link svg {
        stroke: var(--primary);
        transition: transform 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
      }

      .back-text-link:hover {
        color: var(--primary-hover);
        text-decoration: underline;
      }

      .back-text-link:hover svg {
        transform: translateX(-5px);
      }

      /* =================================
         MENU ITEMS GRID (3 Columns)
      ================================= */
      .menu-items-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 24px;
      }

      /* =================================
         MENU ITEM CARD
      ================================= */
      .menu-item-card {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: var(--radius-xl);
        overflow: hidden;
        display: flex;
        flex-direction: column;
        transition: all 0.35s cubic-bezier(0.25, 1, 0.5, 1);
        box-shadow: var(--shadow-sm);
        position: relative;
      }

      .menu-item-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 16px 36px rgba(15, 23, 42, 0.12);
        border-color: rgba(239, 79, 47, 0.25);
      }

      /* Image on top */
      .item-image-box {
        width: 100%;
        height: 195px;
        overflow: hidden;
        position: relative;
        background: #e8edf2;
        flex-shrink: 0;
      }

      .item-image-box img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.55s cubic-bezier(0.25, 1, 0.5, 1);
      }

      .menu-item-card:hover .item-image-box img {
        transform: scale(1.08);
      }

      /* Gradient overlay on bottom of image */
      .item-image-box::after {
        content: "";
        position: absolute;
        bottom: 0; left: 0;
        width: 100%; height: 50px;
        background: linear-gradient(to top, rgba(255,255,255,0.4), transparent);
        pointer-events: none;
      }

      /* Card text body */
      .item-body {
        padding: 18px 20px 20px;
        display: flex;
        flex-direction: column;
        flex: 1;
      }

      /* Veg / Non-veg indicator ABOVE item name */
      .food-type-indicator {
        width: 18px;
        height: 18px;
        border-radius: 4px;
        background: white;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 8px;
        flex-shrink: 0;
      }

      .food-type-indicator.veg { border: 2px solid #16a34a; }
      .food-type-indicator.non-veg { border: 2px solid #dc2626; }

      .type-dot {
        width: 8px;
        height: 8px;
        border-radius: 50%;
      }

      .food-type-indicator.veg .type-dot { background: #16a34a; }
      .food-type-indicator.non-veg .type-dot { background: #dc2626; }

      /* Item Header Row (Name on left, Rating on right corner) */
      .item-header-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 10px;
        margin-bottom: 6px;
      }

      .item-header-row .item-name {
        font-size: 16.5px;
        font-weight: 800;
        color: var(--text-main);
        line-height: 1.3;
        margin-bottom: 0;
        transition: var(--transition);
      }

      .menu-item-card:hover .item-header-row .item-name { color: var(--primary); }

      /* =============================================
         CHANGE 1: Rating badge background → GREEN
      ============================================= */
      .item-rating {
        display: inline-flex;
        align-items: center;
        gap: 4px;
        background: var(--success);   /* changed from #fef3c7 (amber) to green */
        color: white;                  /* changed from #d97706 to white for contrast */
        padding: 3px 8px;
        border-radius: var(--radius-sm);
        font-size: 12.5px;
        font-weight: 800;
        flex-shrink: 0;
      }

      .item-rating svg {
        width: 12px;
        height: 12px;
        fill: white;                   /* changed from #d97706 to white */
      }

      .item-desc {
        font-size: 13px;
        color: var(--text-muted);
        line-height: 1.55;
        margin-bottom: 18px;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
      }

      .item-footer {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 8px;
        margin-top: auto;
      }

	      .item-price {
	    display: flex;
	    align-items: center;
	    gap: 2px;
	    font-family: "Plus Jakarta Sans", sans-serif;
	    font-size: 21px;
	    font-weight: 800;
	    color: var(--text-main);
	    line-height: 1;
	}

      /* =============================================
         CHANGE 2: Currency ₹ same size as price (21px)
      ============================================= */
		.item-price .currency {
		    font-size: 18px;
		    font-weight: 700;
		    margin-right: 2px;
			}

      /* ADD button */
      .add-btn {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 10px 22px;
        background: var(--primary-light);
        color: var(--primary);
        border: 1.5px solid rgba(239, 79, 47, 0.22);
        border-radius: var(--radius-full);
        font-family: inherit;
        font-size: 13.5px;
        font-weight: 800;
        cursor: pointer;
        transition: var(--transition);
        white-space: nowrap;
        text-decoration: none;
      }

      .add-btn svg {
        width: 14px;
        height: 14px;
        stroke: currentColor;
        stroke-width: 3;
        fill: none;
        flex-shrink: 0;
      }

      .add-btn:hover {
        background: var(--primary-gradient);
        color: white;
        border-color: transparent;
        box-shadow: 0 4px 14px rgba(239, 79, 47, 0.32);
        transform: scale(1.05);
      }

      .add-btn.added {
        background: #16a34a !important;
        color: white !important;
        border-color: transparent !important;
        box-shadow: 0 4px 14px rgba(22, 163, 74, 0.35) !important;
      }

      /* =================================
         FEATURES SECTION
      ================================= */
      .features-section {
        background: #ffffff;
        padding: 60px 0;
        border-top: 1px solid var(--border-color);
        border-bottom: 1px solid var(--border-color);
      }

      .features-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 30px;
        width: 90%;
        max-width: 1300px;
        margin: 0 auto;
      }

      .feature-card {
        display: flex;
        align-items: flex-start;
        gap: 20px;
        padding: 24px;
        border-radius: var(--radius-lg);
        background: var(--bg-main);
        border: 1px solid var(--border-color);
        transition: var(--transition);
      }

      .feature-card:hover {
        transform: translateY(-4px);
        box-shadow: var(--shadow-md);
        border-color: var(--primary-light);
      }

      .feature-icon-box {
        width: 54px;
        height: 54px;
        border-radius: 16px;
        background: var(--primary-light);
        display: flex;
        align-items: center;
        justify-content: center;
        flex-shrink: 0;
      }

      .feature-icon-box svg {
        width: 26px;
        height: 26px;
        stroke: var(--primary);
        stroke-width: 2;
        fill: none;
      }

      .feature-content h4 {
        font-size: 17px;
        font-weight: 800;
        color: var(--text-main);
        margin-bottom: 6px;
      }

      .feature-content p {
        font-size: 13.5px;
        color: var(--text-muted);
        line-height: 1.5;
      }

      /* =================================
         FOOTER
      ================================= */
      footer {
        background: var(--dark-bg);
        color: #94a3b8;
        padding: 70px 0 30px;
      }

      .footer-container {
        width: 90%;
        max-width: 1300px;
        margin: 0 auto;
      }

      .footer-top {
        display: grid;
        grid-template-columns: 2fr repeat(3, 1fr);
        gap: 40px;
        padding-bottom: 50px;
        border-bottom: 1px solid var(--dark-surface);
      }

      .footer-brand .logo { color: white; margin-bottom: 16px; }

      .footer-brand p {
        font-size: 14px;
        line-height: 1.6;
        color: #94a3b8;
        max-width: 320px;
        margin-bottom: 24px;
      }

      .footer-column h4 {
        color: white;
        font-size: 16px;
        font-weight: 700;
        margin-bottom: 20px;
      }

      .footer-column ul { list-style: none; }
      .footer-column ul li { margin-bottom: 12px; }
      .footer-column ul a { color: #94a3b8; font-size: 14px; font-weight: 500; }
      .footer-column ul a:hover { color: var(--primary); padding-left: 4px; }

      .social-links { display: flex; gap: 12px; }

      .social-icon {
        width: 38px;
        height: 38px;
        border-radius: 50%;
        background: var(--dark-surface);
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        transition: var(--transition);
      }

      .social-icon:hover { background: var(--primary); transform: translateY(-3px); }
      .social-icon svg { width: 18px; height: 18px; fill: currentColor; }

      .footer-bottom {
        padding-top: 30px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-size: 13.5px;
        color: #64748b;
      }

      .footer-bottom a { color: #94a3b8; }
      .footer-bottom a:hover { color: var(--primary); }

      /* =================================
         RESPONSIVE
      ================================= */
      @media screen and (max-width: 1100px) {
        .menu-items-grid { grid-template-columns: repeat(2, 1fr); }
        .features-grid { grid-template-columns: 1fr; }
        .footer-top { grid-template-columns: 1fr 1fr; }
      }

      @media screen and (max-width: 768px) {
        .navbar { height: 70px; }
        .nav-links { display: none; }
        .menu-hero-banner { height: 200px; }
        .restaurant-strip { flex-direction: column; align-items: flex-start; margin-top: -36px; padding: 18px 20px; }
        .footer-top { grid-template-columns: 1fr; gap: 30px; }
        .footer-bottom { flex-direction: column; gap: 12px; text-align: center; }
      }

      @media screen and (max-width: 600px) {
        .menu-items-grid { grid-template-columns: 1fr; }
        .logo { font-size: 22px; }
        .logo-icon { width: 32px; height: 32px; }
        .logo-icon svg { width: 18px; height: 18px; }
        .btn-auth-ghost { display: none; }
        .btn-auth-solid { padding: 8px 16px; font-size: 13px; }
      }
    </style>
  </head>

  <body>

    <!-- =================================
         HEADER / NAVBAR
    ================================= -->
    <header>
      <nav class="navbar">
        <div class="brand-container">
          <a href="restaurant" class="logo">
            <div class="logo-icon">
              <svg viewBox="0 0 24 24">
                <path d="M12 2C8 7 4 9 4 14a8 8 0 0 0 16 0c0-5-4-7-8-12zm0 17a5 5 0 0 1-5-5c0-2.5 2-4 5-7 3 3 5 4.5 5 7a5 5 0 0 1-5 5z"/>
              </svg>
            </div>
            Food<span>Lounge</span>
          </a>
        </div>

        <div class="nav-menu">
          <ul class="nav-links">
            <li><a href="restaurant">Home</a></li>
            <li><a href="restaurant#categories">Categories</a></li>
            <li><a href="restaurant">Restaurants</a></li>
            <li>
              <a href="cart.jsp" class="nav-plain-icon" title="Cart">
                <svg viewBox="0 0 24 24" width="20" height="20" stroke="currentColor" stroke-width="2" fill="none">
                  <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4zM3 6h18M16 10a4 4 0 0 1-8 0"/>
                </svg>
                Cart
              </a>
            </li>
          </ul>

          <div class="nav-actions">

    <% if (user != null) { %>

    <a href="profile.jsp" class="nav-plain-icon" title="Profile">
        <svg viewBox="0 0 24 24"
             width="20"
             height="20"
             stroke="currentColor"
             stroke-width="2"
             fill="none">

            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2
                     M12 3a4 4 0 1 0 0 8 4 4 0 0 0 0-8z"/>
        </svg>

        <%= user.getUserName() %>
    </a>

    <!-- LOGOUT -->
    <a href="logout" class="nav-plain-icon" title="Logout">
        <svg viewBox="0 0 24 24"
             width="20"
             height="20"
             stroke="currentColor"
             stroke-width="2"
             fill="none">

            <path d="M9 21H5a2 2 0 0 1-2-2V5
                     a2 2 0 0 1 2-2h4"/>

            <polyline points="16 17 21 12 16 7"/>

            <line x1="21" y1="12" x2="9" y2="12"/>
        </svg>

        Logout
    </a>

<% } else { %>

        <a href="login.html" class="nav-plain-icon" title="Login">
            <svg viewBox="0 0 24 24" width="20" height="20"
                 stroke="currentColor" stroke-width="2" fill="none">

                <path d="M12 12a5 5 0 1 0 0-10 5 5 0 0 0 0 10zm0 2
                         c-4.42 0-8 2.24-8 5v3h16v-3c0-2.76-3.58-5-8-5z"/>
            </svg>

            Login
        </a>

    <% } %>

</div>
      </nav>
    </header>

    <!-- =================================
         SIMPLE HERO IMAGE BANNER (NO TEXT / NO ICONS)
    ================================= -->
    <div class="menu-hero-banner"></div>

    <!-- =================================
         PAGE WRAPPER
    ================================= -->
    <div class="page-wrapper">

      <!-- RESTAURANT INFO STRIP (PIZZA PALACE) -->
      <div class="restaurant-strip">
        <div class="strip-left">
          <div class="strip-logo">
            <img
              src="https://images.unsplash.com/photo-1414235077428-338989a2e8c0?q=80&w=200&auto=format&fit=crop"
              alt="Pizza Palace Logo"
            />
          </div>
          <div class="strip-info">
            <h2>
              <%= restaurant.getName() %>
              <svg class="verified-badge" viewBox="0 0 24 24" title="Verified Partner">
                <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"/>
              </svg>
            </h2>
            <div class="strip-meta">
              <div class="strip-badge rating-badge">
                <svg viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
                <%= restaurant.getRating() %>
              </div>
              <div class="strip-dot"></div>
             <div class="strip-badge">
   			 	<span class="food-icon">🍴</span>
    				<%= restaurant.getCuisineType() %>
			</div>
              <div class="strip-dot"></div>
              <div class="strip-badge">
                <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
                <%= restaurant.getDeliveryTime() %> min
              </div>
                    <%
				if(restaurant.isActive()){
			%>
				<div class="open-pill">
				    <span class="live-dot"></span>
				    Open Now
				</div>
				
				<%
				}else{
				%>
				
				<div class="open-pill"
				style="color:red;background:#fee2e2;border-color:#fecaca">
				    Closed
				</div>
				
				<%
				}
				%>
            </div>
          </div>
        </div>
      </div>

      <!-- PLAIN TEXT LINK WITH ARROW (MILD THEME ORANGE COLOR) -->
      <div class="back-to-restaurants-row">
        <a href="restaurant" class="back-text-link" title="Back to Restaurants">
          <svg viewBox="0 0 24 24" width="18" height="18" stroke="currentColor" stroke-width="2.5" fill="none">
            <path d="M19 12H5M12 19l-7-7 7-7"/>
          </svg>
          <span>Back to Restaurants</span>
        </a>
      </div>

      <!-- =====================
           MENU ITEMS GRID
      ===================== -->
      <div class="menu-items-grid">
      
		<%
		List<Menu> allMenuByRestaurantId = (List<Menu>) request.getAttribute("allMenuByRestaurantId");

		for (Menu menu : allMenuByRestaurantId) {
		%>
        <div class="menu-item-card">
          <div class="item-image-box">
            <img src="<%= menu.getImagePath()%>" />
          </div>
          <div class="item-body">
            <div class="food-type-indicator <%= menu.isVeg() ? "veg" : "non-veg" %>"
     			title="<%= menu.isVeg() ? "Vegetarian" : "Non Vegetarian" %>">
    			<div class="type-dot"></div>
			</div>
            <!-- ITEM HEADER ROW (NAME ON LEFT, RATING ON RIGHT CORNER) -->
            <div class="item-header-row">
              <h3 class="item-name"><%= menu.getItemName() %></h3>
              <div class="item-rating">
                <svg viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
                <%= menu.getRating()%>
              </div>
            </div>

            <p class="item-desc"><%= menu.getDescription() %></p>
            <div class="item-footer">
              <div class="item-price">
                <span class="currency">₹</span><%= menu.getPrice() %>
              </div>
              
              <form action="cartServlet" method="post">
    					<input type="hidden" name="menuId" value="<%= menu.getMenuId() %>">
				    <input type="hidden" name="restaurantId" value="<%= menu.getRestaurantId() %>">
				    <input type="hidden" name="qty" value="1">
				    <input type="hidden" name="action" value=add>
	
				    <button type="submit" class="add-btn">
				        <svg viewBox="0 0 24 24">
				            <line x1="12" y1="5" x2="12" y2="19"/>
				            <line x1="5" y1="12" x2="19" y2="12"/>
				        </svg>
				        Add
				    </button>
			</form>
            </div>
          </div>
        </div>
		<%
			}
		%>
		
      </div>
      <!-- /menu-items-grid -->

    </div>
    <!-- /page-wrapper -->

    <!-- =================================
         FEATURES SECTION
    ================================= -->
    <section class="features-section">
      <div class="features-grid">
        <div class="feature-card">
          <div class="feature-icon-box">
            <svg viewBox="0 0 24 24">
              <rect x="1" y="3" width="15" height="13"/>
              <polygon points="16 8 20 8 23 11 23 16 16 16 16 8"/>
              <circle cx="5.5" cy="18.5" r="2.5"/>
              <circle cx="18.5" cy="18.5" r="2.5"/>
            </svg>
          </div>
          <div class="feature-content">
            <h4>Lightning Fast Delivery</h4>
            <p>Hot, fresh meals delivered right to your doorstep in 30 minutes or less.</p>
          </div>
        </div>
        <div class="feature-card">
          <div class="feature-icon-box">
            <svg viewBox="0 0 24 24">
              <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
            </svg>
          </div>
          <div class="feature-content">
            <h4>100% Hygienic Packaging</h4>
            <p>Sealed and sanitized safety packaging for complete peace of mind.</p>
          </div>
        </div>
        <div class="feature-card">
          <div class="feature-icon-box">
            <svg viewBox="0 0 24 24">
              <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
            </svg>
          </div>
          <div class="feature-content">
            <h4>Top Rated Outlets</h4>
            <p>Choose from hundreds of 4+ star rated partner restaurants.</p>
          </div>
        </div>
      </div>
    </section>

    <!-- =================================
         FOOTER
    ================================= -->
    <footer>
      <div class="footer-container">
        <div class="footer-top">
          <div class="footer-brand">
            <a href="index.html" class="logo">
              <div class="logo-icon">
                <svg viewBox="0 0 24 24">
                  <path d="M12 2C8 7 4 9 4 14a8 8 0 0 0 16 0c0-5-4-7-8-12zm0 17a5 5 0 0 1-5-5c0-2.5 2-4 5-7 3 3 5 4.5 5 7a5 5 0 0 1-5 5z"/>
                </svg>
              </div>
              Food<span>Lounge</span>
            </a>
            <p>FoodLounge brings your favorite restaurant dishes straight to your door with superfast delivery and uncompromised quality.</p>
            <div class="social-links">
              <a href="#" class="social-icon" aria-label="Facebook">
                <svg viewBox="0 0 24 24"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"/></svg>
              </a>
              <a href="#" class="social-icon" aria-label="Twitter">
                <svg viewBox="0 0 24 24"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"/></svg>
              </a>
              <a href="#" class="social-icon" aria-label="Instagram">
                <svg viewBox="0 0 24 24"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"/><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"/><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"/></svg>
              </a>
            </div>
          </div>
          <div class="footer-column">
            <h4>Company</h4>
            <ul>
              <li><a href="#">About Us</a></li>
              <li><a href="#">Team &amp; Careers</a></li>
              <li><a href="#">FoodLounge Blog</a></li>
              <li><a href="#">Partner With Us</a></li>
            </ul>
          </div>
          <div class="footer-column">
            <h4>Contact &amp; Help</h4>
            <ul>
              <li><a href="#">Help &amp; Support</a></li>
              <li><a href="#">Partner Support</a></li>
              <li><a href="#">Ride With Us</a></li>
              <li><a href="#">Terms &amp; Conditions</a></li>
            </ul>
          </div>
          <div class="footer-column">
            <h4>Available In</h4>
            <ul>
              <li><a href="#">Bengaluru</a></li>
              <li><a href="#">Mumbai</a></li>
              <li><a href="#">Hyderabad</a></li>
              <li><a href="#">Chennai</a></li>
            </ul>
          </div>
        </div>
        <div class="footer-bottom">
          <p>© 2026 FoodLounge Technologies Pvt. Ltd. All rights reserved.</p>
          <div style="display:flex;gap:20px;">
            <a href="#">Privacy Policy</a>
            <a href="#">Security</a>
            <a href="#">Terms of Service</a>
          </div>
        </div>
      </div>
    </footer>

   
  </body>
</html>