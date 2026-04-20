<%@ Page Title="Add/Drop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDrop.aspx.cs" Inherits="Web_Project.AddDrop" %>

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

            --success:       #34d399;

            --radius-xl:     24px;
            --radius-lg:     16px;
            --radius-md:     12px;

            --transition:    all 0.35s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .adddrop-page {
            max-width: 1100px;
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

        .adddrop-page::before {
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

        .adddrop-page::after {
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

        .adddrop-inner {
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
            margin: 0 0 20px;
            font-size: 2rem;
            font-weight: 800;
            letter-spacing: -0.03em;
            background: linear-gradient(180deg, #ffffff 0%, #a1a1aa 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .form-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-lg);
            padding: 22px;
            margin-bottom: 20px;
            transition: var(--transition);
        }

        .form-card:hover {
            border-color: var(--border-hover);
            background: var(--bg-card-hover);
            transform: translateY(-2px);
            box-shadow: 0 12px 28px rgba(0,0,0,0.45);
        }

        .form-label {
            display: block;
            margin: 0 0 8px;
            font-size: 0.88rem;
            font-weight: 600;
            color: #e4e4e7;
        }

        .course-select {
            width: 100%;
            max-width: 420px;
            height: 46px;
            padding: 10px 12px;
            box-sizing: border-box;
            border-radius: var(--radius-md);
            border: 1px solid var(--border-color);
            background: #0d0d0d;
            color: var(--text-main);
            outline: none;
            transition: var(--transition);
            margin-bottom: 14px;
        }

        .course-select:hover {
            border-color: var(--border-hover);
            background: #121212;
            transform: translateY(-1px);
        }

        .course-select:focus {
            border-color: rgba(129, 140, 248, 0.55);
            box-shadow: 0 0 0 4px rgba(129, 140, 248, 0.12);
            transform: translateY(-1px);
        }

        .action-row {
            display: flex;
            flex-wrap: wrap;
            gap: 18px;
            margin: 8px 0 16px;
        }

        /* style radio labels */
        .action-row input[type="radio"] {
            accent-color: #818cf8;
            transform: translateY(1px);
        }

        .action-row label {
            color: #e4e4e7;
            font-size: 0.92rem;
            font-weight: 500;
            margin-left: 6px;
            margin-right: 14px;
        }

        .submit-btn {
            min-width: 140px;
            height: 46px;
            border: 1px solid transparent;
            border-radius: var(--radius-md);
            background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 50%, #a855f7 100%);
            background-size: 200% 200%;
            color: #fff;
            font-size: 0.95rem;
            font-weight: 700;
            letter-spacing: 0.01em;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            transition: var(--transition);
            box-shadow: 0 10px 24px rgba(99, 102, 241, 0.35);
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            background-position: 100% 0;
            box-shadow: 0 14px 30px rgba(139, 92, 246, 0.45);
            filter: saturate(1.1);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        .submit-btn::after {
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
                rgba(255,255,255,.35) 50%,
                rgba(255,255,255,0) 100%
            );
            transition: left 0.55s ease;
        }

        .submit-btn:hover::after {
            left: 135%;
        }

        .msg-text {
            display: block;
            margin-top: 14px;
            min-height: 20px;
            font-size: 0.9rem;
            font-weight: 600;
            color: var(--success) !important;
        }

        .sec-label {
            display: flex;
            align-items: center;
            gap: 16px;
            margin: 8px 0 14px;
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

        .grid-wrap {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-lg);
            padding: 14px;
            overflow-x: auto;
            transition: var(--transition);
        }

        .grid-wrap:hover {
            border-color: var(--border-hover);
            background: var(--bg-card-hover);
            box-shadow: 0 12px 28px rgba(0,0,0,0.4);
        }

        .grid-wrap table {
            width: 100%;
            border-collapse: collapse;
            min-width: 560px;
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
            background: rgba(255,255,255,0.02);
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
            .adddrop-page {
                margin: 18px auto;
                padding: 20px 16px;
                border-radius: 16px;
            }

            .page-title {
                font-size: 1.6rem;
            }

            .course-select {
                max-width: 100%;
            }

            .action-row {
                gap: 10px;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            .adddrop-page,
            .form-card,
            .grid-wrap,
            .course-select,
            .submit-btn,
            .submit-btn::after,
            .pulse-dot {
                animation: none !important;
                transition: none !important;
                transform: none !important;
            }
        }
    </style>

    <div class="adddrop-page">
        <div class="adddrop-inner">

            <div class="page-eyebrow">
                <span class="pulse-dot"></span>
                Schedule Management
            </div>

            <h2 class="page-title">Add / Drop Course</h2>

            <div class="form-card">
                <asp:Label ID="Label1" runat="server" Text="Select Course:" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="course-select"></asp:DropDownList>

                <div class="action-row">
                    <asp:RadioButton ID="rbAdd" runat="server" GroupName="action" Text="Add Course" />
                    <asp:RadioButton ID="rbDrop" runat="server" GroupName="action" Text="Drop Course" />
                </div>

                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="submit-btn" />
                <asp:Label ID="lblMsg" runat="server" CssClass="msg-text"></asp:Label>
            </div>

            <div class="sec-label">
                <span class="sec-label-text">Add/Drop History</span>
                <div class="sec-label-line"></div>
            </div>

            <div class="grid-wrap">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true"></asp:GridView>
            </div>

        </div>
    </div>

</asp:Content>