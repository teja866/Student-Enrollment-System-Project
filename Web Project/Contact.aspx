<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Web_Project.Contact" %>

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
            --border-hover:  rgba(255, 255, 255, 0.20);

            --accent:        #818cf8;
            --accent-2:      #a855f7;
            --accent-glow:   rgba(99, 102, 241, 0.35);

            --radius-xl:     24px;
            --radius-lg:     16px;
            --radius-md:     12px;

            --transition:    all 0.35s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .contact-page {
            max-width: 980px;
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

        .contact-page::before {
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

        .contact-page::after {
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

        .contact-inner {
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
            background: var(--accent);
            box-shadow: 0 0 10px var(--accent);
            animation: pulse 2s infinite;
        }

        .contact-title {
            margin: 0 0 8px;
            font-size: 2rem;
            font-weight: 800;
            letter-spacing: -0.03em;
            background: linear-gradient(180deg, #ffffff 0%, #a1a1aa 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .contact-subtitle {
            margin: 0 0 22px;
            color: var(--text-muted);
            font-size: 1rem;
        }

        .contact-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(260px, 1fr));
            gap: 16px;
        }

        .contact-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-lg);
            padding: 22px;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .contact-card:hover {
            border-color: var(--border-hover);
            background: var(--bg-card-hover);
            transform: translateY(-3px);
            box-shadow: 0 14px 30px rgba(0,0,0,0.5);
        }

        .contact-card::before {
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

        .contact-card:hover::before {
            opacity: 1;
        }

        .card-title {
            margin: 0 0 12px;
            font-size: 0.88rem;
            font-weight: 700;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: #e5e7eb;
        }

        address {
            margin: 0;
            color: var(--text-muted);
            line-height: 1.8;
            font-size: 0.93rem;
        }

        abbr[title] {
            text-decoration: none;
            border-bottom: 1px dotted rgba(255,255,255,0.25);
            cursor: help;
        }

        strong {
            color: #ffffff;
            font-weight: 700;
        }

        a {
            color: #c4b5fd;
            text-decoration: none;
            border-bottom: 1px dashed transparent;
            transition: var(--transition);
            position: relative;
        }

        a:hover {
            color: #ffffff;
            border-bottom-color: rgba(255,255,255,0.45);
            text-shadow: 0 0 10px rgba(129,140,248,0.35);
        }

        /* subtle underline grow animation */
        a::after {
            content: "";
            position: absolute;
            left: 0;
            bottom: -2px;
            width: 0;
            height: 1px;
            background: linear-gradient(90deg, var(--accent), var(--accent-2));
            transition: width .28s ease;
        }

        a:hover::after {
            width: 100%;
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
            .contact-page {
                margin: 18px auto;
                padding: 20px 16px;
                border-radius: 16px;
            }

            .contact-title {
                font-size: 1.6rem;
            }

            .contact-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            .contact-page,
            .contact-card,
            .pulse-dot,
            a,
            a::after {
                animation: none !important;
                transition: none !important;
                transform: none !important;
            }
        }
    </style>

    <main class="contact-page" aria-labelledby="title">
        <div class="contact-inner">

            <div class="page-eyebrow">
                <span class="pulse-dot"></span>
                Reach Us
            </div>

            <h2 id="title" class="contact-title"><%: Title %></h2>
            <h3 class="contact-subtitle">Your contact page.</h3>

            <div class="contact-grid">
                <section class="contact-card" aria-label="Office Address">
                    <h4 class="card-title">Office</h4>
                    <address>
                        Guntur, Andhra Pradesh<br />
                        India<br />
                        <abbr title="Phone">P:</abbr>
                        +91 9398474878
                    </address>
                </section>

                <section class="contact-card" aria-label="Email Contacts">
                    <h4 class="card-title">Email</h4>
                    <address>
                        <strong>Support:</strong>
                        <a href="mailto:i26039582@student.newinti.edu.my">i26039582@student.newinti.edu.my</a><br />
                        <strong>Marketing:</strong>
                        <a href="mailto:i26039549@student.newinti.edu.my">i26039549@student.newinti.edu.my</a>
                    </address>
                </section>
            </div>

        </div>
    </main>
</asp:Content>