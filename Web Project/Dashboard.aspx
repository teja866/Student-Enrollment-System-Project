<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Web_Project.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* Dark premium theme (matching About/Login pages) */
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
            --accent-color:  #818cf8;

            --radius-xl:     24px;
            --radius-lg:     16px;
            --radius-md:     12px;

            --transition:    all 0.35s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .dashboard-page {
            max-width: 1080px;
            margin: 40px auto;
            padding: 36px;
            font-family: "Inter", "SF Pro Display", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background: var(--bg-main);
            color: var(--text-main);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-color);
            line-height: 1.6;
            position: relative;
            overflow: hidden;
            animation: fadeUp 0.6s ease both;
        }

        .dashboard-page::before {
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

        .dashboard-page::after {
            content: "";
            position: absolute;
            top: -120px;
            left: 50%;
            transform: translateX(-50%);
            width: 640px;
            height: 300px;
            background: radial-gradient(ellipse at top, var(--accent-glow), transparent 70%);
            pointer-events: none;
            z-index: 0;
            opacity: 0.7;
        }

        .dashboard-inner {
            position: relative;
            z-index: 1;
        }

        .dash-eyebrow {
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
            background: var(--accent-color);
            box-shadow: 0 0 10px var(--accent-color);
            animation: pulse 2s infinite;
        }

        .dash-title {
            margin: 0 0 8px;
            font-size: 2rem;
            font-weight: 800;
            letter-spacing: -0.03em;
            background: linear-gradient(180deg, #ffffff 0%, #a1a1aa 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .welcome-card {
            margin-top: 16px;
            margin-bottom: 28px;
            padding: 20px;
            border-radius: var(--radius-lg);
            border: 1px solid var(--border-color);
            background: var(--bg-card);
            transition: var(--transition);
        }

        .welcome-card:hover {
            border-color: var(--border-hover);
            background: var(--bg-card-hover);
            transform: translateY(-2px);
            box-shadow: 0 12px 28px rgba(0,0,0,0.45);
        }

        /* style ASP label */
        .welcome-text {
            font-size: 1.05rem;
            font-weight: 600;
            color: #c4b5fd !important;
        }

        .sec-label {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-bottom: 18px;
        }

        .sec-label-text {
            font-size: 0.82rem;
            font-weight: 700;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--text-main);
        }

        .sec-label-line {
            flex: 1;
            height: 1px;
            background: linear-gradient(90deg, var(--border-color), transparent);
        }

        .quick-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(220px, 1fr));
            gap: 16px;
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .quick-grid li {
            margin: 0;
        }

        .quick-link {
            display: block;
            text-decoration: none;
            color: var(--text-main);
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-lg);
            padding: 18px 18px 18px 46px;
            position: relative;
            font-size: 0.96rem;
            font-weight: 600;
            transition: var(--transition);
            overflow: hidden;
        }

        .quick-link::before {
            content: "";
            position: absolute;
            left: 16px;
            top: 50%;
            width: 14px;
            height: 14px;
            border-radius: 50%;
            transform: translateY(-50%);
            background: linear-gradient(180deg, #818cf8, #a855f7);
            box-shadow: 0 0 10px rgba(129,140,248,0.65);
        }

        /* top light streak */
        .quick-link::after {
            content: "";
            position: absolute;
            top: 0;
            left: -130%;
            width: 50%;
            height: 100%;
            transform: skewX(-18deg);
            background: linear-gradient(
                110deg,
                rgba(255,255,255,0) 0%,
                rgba(255,255,255,.22) 50%,
                rgba(255,255,255,0) 100%
            );
            transition: left .55s ease;
        }

        .quick-link:hover {
            border-color: var(--border-hover);
            background: var(--bg-card-hover);
            transform: translateY(-3px);
            box-shadow: 0 14px 30px rgba(0,0,0,0.5);
        }

        .quick-link:hover::after {
            left: 140%;
        }

        .quick-link span {
            color: var(--text-muted);
            font-weight: 500;
            font-size: 0.84rem;
            display: block;
            margin-top: 4px;
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
            .dashboard-page {
                margin: 18px auto;
                padding: 20px 16px;
                border-radius: 16px;
            }

            .dash-title {
                font-size: 1.6rem;
            }

            .quick-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            .dashboard-page,
            .welcome-card,
            .quick-link,
            .quick-link::after,
            .pulse-dot {
                animation: none !important;
                transition: none !important;
                transform: none !important;
            }
        }
    </style>

    <div class="dashboard-page">
        <div class="dashboard-inner">

            <div class="dash-eyebrow">
                <span class="pulse-dot"></span>
                Student Portal
            </div>

            <h2 class="dash-title">Dashboard</h2>

            <div class="welcome-card">
                <asp:Label ID="lblWelcome" runat="server" CssClass="welcome-text"></asp:Label>
            </div>

            <div class="sec-label">
                <span class="sec-label-text">Quick Navigation</span>
                <div class="sec-label-line"></div>
            </div>

            <ul class="quick-grid">
                <li>
                    <a class="quick-link" href="Enrollment.aspx">
                        Course Enrollment
                        <span>Register for available courses</span>
                    </a>
                </li>
                <li>
                    <a class="quick-link" href="AddDrop.aspx">
                        Add / Drop Course
                        <span>Modify your academic schedule</span>
                    </a>
                </li>
                <li>
                    <a class="quick-link" href="Payment.aspx">
                        Payment
                        <span>Pay fees and track transactions</span>
                    </a>
                </li>
                <li>
                    <a class="quick-link" href="Profile.aspx">
                        Profile
                        <span>Manage account and personal info</span>
                    </a>
                </li>
            </ul>

        </div>
    </div>

</asp:Content>