<%@ Page Title="Statement" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Statement.aspx.cs" Inherits="Web_Project.Statement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* Match same premium dark theme */
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

        .statement-page {
            max-width: 1180px;
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

        .statement-page::before {
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

        .statement-page::after {
            content: "";
            position: absolute;
            top: -120px;
            left: 50%;
            transform: translateX(-50%);
            width: 680px;
            height: 320px;
            background: radial-gradient(ellipse at top, var(--accent-glow), transparent 70%);
            pointer-events: none;
            z-index: 0;
            opacity: 0.7;
        }

        .statement-inner {
            position: relative;
            z-index: 1;
        }

        .page-eyebrow {
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
            margin-bottom: 14px;
        }

        .pulse-dot {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: var(--accent-color);
            box-shadow: 0 0 10px var(--accent-color);
            animation: pulse 2s infinite;
        }

        .page-title {
            margin: 0 0 10px;
            font-size: 2rem;
            font-weight: 800;
            letter-spacing: -0.03em;
            background: linear-gradient(180deg, #ffffff 0%, #a1a1aa 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .summary-text {
            display: block;
            margin: 0 0 24px;
            font-size: 0.95rem;
            color: #c4b5fd !important;
            font-weight: 600;
        }

        .section-block {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-lg);
            padding: 18px;
            margin-bottom: 18px;
            transition: var(--transition);
        }

        .section-block:hover {
            border-color: var(--border-hover);
            background: var(--bg-card-hover);
            transform: translateY(-2px);
            box-shadow: 0 12px 28px rgba(0,0,0,0.45);
        }

        .sec-label {
            display: flex;
            align-items: center;
            gap: 14px;
            margin-bottom: 14px;
        }

        .sec-label-text {
            font-size: 0.82rem;
            font-weight: 700;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--text-main);
            white-space: nowrap;
        }

        .sec-label-line {
            flex: 1;
            height: 1px;
            background: linear-gradient(90deg, var(--border-color), transparent);
        }

        .grid-wrap {
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            overflow-x: auto;
            background: rgba(255,255,255,0.01);
        }

        .grid-wrap table {
            width: 100%;
            border-collapse: collapse;
            min-width: 620px;
        }

        .grid-wrap th,
        .grid-wrap td {
            border-bottom: 1px solid var(--border-color);
            padding: 12px 10px;
            text-align: left;
            font-size: 0.9rem;
        }

        .grid-wrap th {
            color: #e4e4e7;
            font-weight: 700;
            letter-spacing: 0.01em;
            background: rgba(255,255,255,0.03);
        }

        .grid-wrap td {
            color: var(--text-muted);
        }

        .grid-wrap tr:hover td {
            background: rgba(255,255,255,0.03);
            color: #fff;
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
            .statement-page {
                margin: 18px auto;
                padding: 20px 16px;
                border-radius: 16px;
            }

            .page-title {
                font-size: 1.6rem;
            }

            .summary-text {
                font-size: 0.9rem;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            .statement-page,
            .section-block,
            .pulse-dot {
                animation: none !important;
                transition: none !important;
                transform: none !important;
            }
        }
    </style>

    <div class="statement-page">
        <div class="statement-inner">

            <div class="page-eyebrow">
                <span class="pulse-dot"></span>
                Academic Records
            </div>

            <h2 class="page-title">Student Statement</h2>

            <asp:Label ID="lblTitle" runat="server" Text="Your Academic &amp; Payment Summary" CssClass="summary-text"></asp:Label>

            <div class="section-block">
                <div class="sec-label">
                    <span class="sec-label-text">Enrolled Courses</span>
                    <div class="sec-label-line"></div>
                </div>

                <div class="grid-wrap">
                    <asp:GridView 
                        ID="gvEnrollments" 
                        runat="server" 
                        AutoGenerateColumns="true"
                        BorderWidth="0"
                        CellPadding="0">
                    </asp:GridView>
                </div>
            </div>

            <div class="section-block">
                <div class="sec-label">
                    <span class="sec-label-text">Payment History</span>
                    <div class="sec-label-line"></div>
                </div>

                <div class="grid-wrap">
                    <asp:GridView 
                        ID="gvPayments" 
                        runat="server" 
                        AutoGenerateColumns="true"
                        BorderWidth="0"
                        CellPadding="0">
                    </asp:GridView>
                </div>
            </div>

        </div>
    </div>

</asp:Content>