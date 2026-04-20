<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web_Project._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* Keep same premium dark design language */
        body {
            background-color: #000000 !important;
            color: #ffffff !important;
        }

        :root {
            --bg-main:       #000000;
            --bg-card:       #0a0a0a;
            --bg-card-hover: #111111;

            --text-main:     #ffffff;
            --text-muted:    #a1a1aa;

            --border-color:  rgba(255, 255, 255, 0.08);
            --border-hover:  rgba(255, 255, 255, 0.2);

            --accent-glow:   rgba(99, 102, 241, 0.4);
            --accent:        #818cf8;
            --accent-2:      #a855f7;

            --radius-xl:     24px;
            --radius-lg:     16px;
            --radius-md:     12px;

            --transition:    all 0.35s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .home-page {
            max-width: 1160px;
            margin: 40px auto;
            padding: 36px;
            font-family: "Inter", "SF Pro Display", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background: var(--bg-main);
            color: var(--text-main);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-color);
            position: relative;
            overflow: hidden;
            animation: fadeUp 0.6s ease both;
        }

        .home-page::before {
            content: "";
            position: absolute;
            inset: 0;
            background-image: linear-gradient(var(--border-color) 1px, transparent 1px),
                              linear-gradient(90deg, var(--border-color) 1px, transparent 1px);
            background-size: 40px 40px;
            opacity: 0.18;
            z-index: 0;
            pointer-events: none;
            mask-image: radial-gradient(circle at center, black, transparent 80%);
            -webkit-mask-image: radial-gradient(circle at center, black, transparent 80%);
        }

        .home-page::after {
            content: "";
            position: absolute;
            top: -120px;
            left: 50%;
            transform: translateX(-50%);
            width: 700px;
            height: 340px;
            background: radial-gradient(ellipse at top, var(--accent-glow), transparent 70%);
            pointer-events: none;
            z-index: 0;
            opacity: 0.7;
        }

        .home-inner {
            position: relative;
            z-index: 1;
        }

        /* HERO */
        .hero {
            text-align: center;
            padding: 36px 18px 28px;
            margin-bottom: 18px;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-lg);
            background: linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.00));
            transition: var(--transition);
        }

        .hero:hover {
            border-color: var(--border-hover);
            background: linear-gradient(180deg, rgba(255,255,255,0.04), rgba(255,255,255,0.01));
            transform: translateY(-2px);
            box-shadow: 0 14px 30px rgba(0,0,0,0.45);
        }

        .home-kicker {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 0.75rem;
            font-weight: 600;
            letter-spacing: 0.05em;
            color: var(--text-muted);
            background: rgba(255, 255, 255, 0.03);
            padding: 6px 14px;
            border-radius: 999px;
            border: 1px solid var(--border-color);
            margin-bottom: 16px;
        }

        .pulse-dot {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: var(--accent);
            box-shadow: 0 0 10px var(--accent);
            animation: pulse 2s infinite;
        }

        .hero h1 {
            margin: 0 0 12px;
            font-size: 2.4rem;
            font-weight: 800;
            letter-spacing: -0.03em;
            line-height: 1.08;
            background: linear-gradient(180deg, #ffffff 0%, #a1a1aa 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero .lead {
            margin: 0 auto 20px;
            max-width: 760px;
            color: var(--text-muted);
            font-size: 1.02rem;
        }

        /* Buttons */
        .btn-primary,
        .btn-default {
            border-radius: 12px !important;
            font-weight: 600 !important;
            letter-spacing: 0.01em;
            padding: 10px 16px !important;
            transition: var(--transition) !important;
            border: 1px solid transparent !important;
            text-decoration: none !important;
            position: relative;
            overflow: hidden;
        }

        .btn-primary {
            color: #fff !important;
            background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 50%, #a855f7 100%) !important;
            background-size: 200% 200% !important;
            box-shadow: 0 10px 24px rgba(99, 102, 241, 0.35) !important;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            background-position: 100% 0 !important;
            box-shadow: 0 14px 30px rgba(139, 92, 246, 0.45) !important;
            filter: saturate(1.1);
        }

        .btn-default {
            color: #e5e7eb !important;
            background: rgba(255,255,255,0.03) !important;
            border-color: var(--border-color) !important;
        }

        .btn-default:hover {
            color: #fff !important;
            border-color: var(--border-hover) !important;
            background: rgba(255,255,255,0.07) !important;
            transform: translateY(-2px);
            box-shadow: 0 10px 22px rgba(0,0,0,0.35);
        }

        /* shine effect for popular hover style */
        .btn-primary::after,
        .btn-default::after {
            content: "";
            position: absolute;
            top: 0;
            left: -130%;
            width: 55%;
            height: 100%;
            transform: skewX(-18deg);
            background: linear-gradient(
                110deg,
                rgba(255,255,255,0) 0%,
                rgba(255,255,255,.28) 50%,
                rgba(255,255,255,0) 100%
            );
            transition: left .55s ease;
        }

        .btn-primary:hover::after,
        .btn-default:hover::after {
            left: 135%;
        }

        /* FEATURE CARDS */
        .feature-grid {
            margin-top: 18px;
        }

        .feature-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-lg);
            padding: 22px;
            height: 100%;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .feature-card:hover {
            border-color: var(--border-hover);
            background: var(--bg-card-hover);
            transform: translateY(-4px);
            box-shadow: 0 16px 32px rgba(0,0,0,0.55);
        }

        .feature-card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 18px;
            right: 18px;
            height: 1px;
            opacity: 0;
            transition: var(--transition);
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.35), transparent);
        }

        .feature-card:hover::before {
            opacity: 1;
        }

        .feature-card h2 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 1.15rem;
            font-weight: 700;
            color: var(--text-main);
            letter-spacing: -0.01em;
        }

        .feature-card p {
            color: var(--text-muted);
            font-size: 0.92rem;
            line-height: 1.6;
            margin-bottom: 16px;
        }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(12px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50%      { opacity: 0.45; }
        }

        @media (max-width: 768px) {
            .home-page {
                margin: 18px auto;
                padding: 20px 16px;
                border-radius: 16px;
            }

            .hero {
                padding: 24px 12px 20px;
            }

            .hero h1 {
                font-size: 1.8rem;
            }

            .hero .lead {
                font-size: 0.95rem;
            }

            .feature-card {
                margin-bottom: 14px;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            .home-page,
            .hero,
            .feature-card,
            .btn-primary,
            .btn-default,
            .btn-primary::after,
            .btn-default::after,
            .pulse-dot {
                animation: none !important;
                transition: none !important;
                transform: none !important;
            }
        }
    </style>

    <main class="home-page">
        <div class="home-inner">

            <section class="hero row" aria-labelledby="aspnetTitle">
                <div class="home-kicker">
                    <span class="pulse-dot"></span>
                    Web Platform
                </div>

                <h1 id="aspnetTitle">ASP.NET</h1>
                <p class="lead">
                    ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.
                </p>
                <p>
                    <a href="http://www.asp.net" class="btn btn-primary btn-md">Learn more &raquo;</a>
                </p>
            </section>

            <div class="row feature-grid">
                <section class="col-md-4" aria-labelledby="gettingStartedTitle">
                    <div class="feature-card">
                        <h2 id="gettingStartedTitle">Getting started</h2>
                        <p>
                            ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
                            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
                        </p>
                        <p>
                            <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
                        </p>
                    </div>
                </section>

                <section class="col-md-4" aria-labelledby="librariesTitle">
                    <div class="feature-card">
                        <h2 id="librariesTitle">Get more libraries</h2>
                        <p>
                            NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
                        </p>
                        <p>
                            <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
                        </p>
                    </div>
                </section>

                <section class="col-md-4" aria-labelledby="hostingTitle">
                    <div class="feature-card">
                        <h2 id="hostingTitle">Web Hosting</h2>
                        <p>
                            You can easily find a web hosting company that offers the right mix of features and price for your applications.
                        </p>
                        <p>
                            <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
                        </p>
                    </div>
                </section>
            </div>

        </div>
    </main>

</asp:Content>