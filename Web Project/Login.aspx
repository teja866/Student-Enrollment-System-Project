<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web_Project.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* Override master page body for premium dark theme */
        body {
            background-color: #000000 !important;
            color: #ffffff !important;
        }

        /* ═══════════════════════════════════════════
           PREMIUM SAAS DESIGN TOKENS (Linear/Vercel vibe)
        ═══════════════════════════════════════════ */
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

            --danger:        #f87171;

            --radius-xl:     24px;
            --radius-lg:     16px;
            --radius-md:     12px;

            --transition:    all 0.35s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .login-page {
            max-width: 480px;
            margin: 44px auto;
            padding: 34px;
            font-family: "Inter", "SF Pro Display", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background: var(--bg-main);
            color: var(--text-main);
            border-radius: var(--radius-xl);
            line-height: 1.5;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            position: relative;
            overflow: hidden;
            border: 1px solid var(--border-color);

            animation: fadeUp 0.65s ease both;
            transition: var(--transition);
        }

        /* subtle grid pattern */
        .login-page::before {
            content: "";
            position: absolute;
            inset: 0;
            background-image: linear-gradient(var(--border-color) 1px, transparent 1px),
                              linear-gradient(90deg, var(--border-color) 1px, transparent 1px);
            background-size: 36px 36px;
            opacity: 0.18;
            z-index: 0;
            pointer-events: none;
            mask-image: radial-gradient(circle at center, black, transparent 80%);
            -webkit-mask-image: radial-gradient(circle at center, black, transparent 80%);
        }

        /* top glow */
        .login-page::after {
            content: "";
            position: absolute;
            top: -120px;
            left: 50%;
            transform: translateX(-50%);
            width: 520px;
            height: 260px;
            background: radial-gradient(ellipse at top, var(--accent-glow), transparent 70%);
            pointer-events: none;
            z-index: 0;
            opacity: 0.65;
        }

        .login-page:hover {
            border-color: var(--border-hover);
            box-shadow: 0 18px 45px rgba(0,0,0,0.55);
            transform: translateY(-3px);
        }

        .login-inner {
            position: relative;
            z-index: 1;
        }

        .login-eyebrow {
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
            margin-bottom: 20px;
            backdrop-filter: blur(10px);
        }

        .eyebrow-pulse {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: var(--accent-color);
            box-shadow: 0 0 10px var(--accent-color);
            animation: pulse 2s infinite;
        }

        .login-title {
            font-size: 2rem;
            font-weight: 800;
            letter-spacing: -0.03em;
            line-height: 1.1;
            margin: 0 0 10px;
            background: linear-gradient(180deg, #ffffff 0%, #a1a1aa 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .login-subtitle {
            margin: 0 0 24px;
            font-size: 0.95rem;
            color: var(--text-muted);
        }

        .field-group {
            margin-bottom: 16px;
        }

        .form-label {
            display: block;
            margin: 0 0 8px;
            font-size: 0.85rem;
            font-weight: 600;
            letter-spacing: 0.02em;
            color: #e4e4e7;
        }

        .login-input {
            width: 100%;
            height: 46px;
            padding: 10px 14px;
            box-sizing: border-box;
            border-radius: var(--radius-md);
            border: 1px solid var(--border-color);
            background: var(--bg-card);
            color: var(--text-main);
            outline: none;
            transition: var(--transition);
        }

        .login-input::placeholder {
            color: #71717a;
        }

        /* popular hover + focus interactions */
        .login-input:hover {
            border-color: var(--border-hover);
            background: var(--bg-card-hover);
            transform: translateY(-1px);
        }

        .login-input:focus {
            border-color: rgba(129, 140, 248, 0.55);
            background: var(--bg-card-hover);
            box-shadow: 0 0 0 4px rgba(129, 140, 248, 0.12);
            transform: translateY(-1px);
        }

        .validator {
            display: block;
            margin-top: 6px;
            color: var(--danger);
            font-size: 0.8rem;
            font-weight: 500;
        }

        .actions {
            margin-top: 6px;
        }

        .login-btn {
            width: 100%;
            height: 48px;
            border: 1px solid transparent;
            border-radius: var(--radius-md);
            background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 50%, #a855f7 100%);
            background-size: 200% 200%;
            color: #fff;
            font-size: 0.98rem;
            font-weight: 700;
            letter-spacing: 0.01em;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            transition: var(--transition);
            box-shadow: 0 10px 24px rgba(99, 102, 241, 0.35);
        }

        /* popular gradient shift animation on hover */
        .login-btn:hover {
            transform: translateY(-2px);
            background-position: 100% 0;
            box-shadow: 0 14px 30px rgba(139, 92, 246, 0.45);
            filter: saturate(1.1);
        }

        .login-btn:active {
            transform: translateY(0);
        }

        /* shine sweep animation */
        .login-btn::after {
            content: "";
            position: absolute;
            top: 0;
            left: -130%;
            width: 55%;
            height: 100%;
            background: linear-gradient(
                110deg,
                rgba(255,255,255,0) 0%,
                rgba(255,255,255,.35) 50%,
                rgba(255,255,255,0) 100%
            );
            transform: skewX(-18deg);
            transition: left 0.55s ease;
        }

        .login-btn:hover::after {
            left: 135%;
        }

        .message {
            display: block;
            margin-top: 14px;
            min-height: 20px;
            font-size: 0.88rem;
            font-weight: 600;
            color: var(--danger);
        }

        .helper-row {
            margin-top: 14px;
            text-align: center;
            color: var(--text-muted);
            font-size: 0.82rem;
        }

        .helper-row a {
            color: #c4b5fd;
            text-decoration: none;
            border-bottom: 1px dashed transparent;
            transition: var(--transition);
        }

        .helper-row a:hover {
            color: #ffffff;
            border-bottom-color: rgba(255,255,255,0.45);
        }

        /* animations */
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(12px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50%      { opacity: 0.45; }
        }

        /* responsive */
        @media (max-width: 576px) {
            .login-page {
                margin: 18px auto;
                padding: 22px 16px;
                border-radius: 16px;
            }
            .login-title {
                font-size: 1.6rem;
            }
        }

        /* reduced motion support */
        @media (prefers-reduced-motion: reduce) {
            .login-page,
            .login-page:hover,
            .login-input,
            .login-btn,
            .login-btn::after,
            .eyebrow-pulse {
                animation: none !important;
                transition: none !important;
                transform: none !important;
            }
        }
    </style>

    <div class="login-page">
        <div class="login-inner">

            <div class="login-eyebrow">
                <span class="eyebrow-pulse"></span>
                Secure Access
            </div>

            <h2 class="login-title">Student Login</h2>
            <p class="login-subtitle">Sign in to manage courses, payments, and profile settings.</p>

            <div class="field-group">
                <asp:Label ID="Label1" runat="server" Text="Student ID" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtStudentID" runat="server" CssClass="login-input" placeholder="Enter your Student ID"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvID"
                    runat="server"
                    ControlToValidate="txtStudentID"
                    ErrorMessage="Enter Student ID"
                    CssClass="validator" />
            </div>

            <div class="field-group">
                <asp:Label ID="Label2" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="login-input" placeholder="Enter your password"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvPass"
                    runat="server"
                    ControlToValidate="txtPassword"
                    ErrorMessage="Enter Password"
                    CssClass="validator" />
            </div>

            <div class="actions">
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="login-btn" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <div class="helper-row">
                Need help? <a href="Contact.aspx">Contact Support</a>
            </div>

        </div>
    </div>

</asp:Content>