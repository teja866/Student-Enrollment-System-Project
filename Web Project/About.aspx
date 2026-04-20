<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Web_Project.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* Override the Master Page's default white body background */
        body {
            background-color: #000000 !important;
            color: #ffffff !important;
        }

        /* ═══════════════════════════════════════════
           PREMIUM SAAS DESIGN TOKENS (Linear / Vercel Vibe)
        ══════════════════════════════════════════ */
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
            
            --transition:    all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .about-page {
            max-width: 1040px;
            margin: 40px auto;
            padding: 40px;
            font-family: "Inter", "SF Pro Display", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background: var(--bg-main);
            color: var(--text-main);
            border-radius: var(--radius-xl);
            line-height: 1.6;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            position: relative;
            overflow: hidden;
        }

        /* Subtle Grid Pattern Background */
        .about-page::before {
            content: "";
            position: absolute;
            inset: 0;
            background-image: linear-gradient(var(--border-color) 1px, transparent 1px),
                              linear-gradient(90deg, var(--border-color) 1px, transparent 1px);
            background-size: 40px 40px;
            opacity: 0.2;
            z-index: 0;
            pointer-events: none;
            mask-image: radial-gradient(circle at center, black, transparent 80%);
            -webkit-mask-image: radial-gradient(circle at center, black, transparent 80%);
        }

        /* ═══════════════════════════════════════════
           HERO SECTION
        ═══════════════════════════════════════════ */
        .about-hero {
            position: relative;
            z-index: 1;
            padding: 60px 20px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 40px;
        }

        /* Top Central Glow */
        .about-hero::after {
            content: "";
            position: absolute;
            top: -100px;
            left: 50%;
            transform: translateX(-50%);
            width: 600px;
            height: 300px;
            background: radial-gradient(ellipse at top, var(--accent-glow), transparent 70%);
            pointer-events: none;
            z-index: -1;
            opacity: 0.7;
        }

        .about-eyebrow {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 0.75rem;
            font-weight: 600;
            letter-spacing: 0.05em;
            color: var(--text-muted);
            background: rgba(255, 255, 255, 0.03);
            padding: 6px 16px;
            border-radius: 999px;
            border: 1px solid var(--border-color);
            margin-bottom: 24px;
            backdrop-filter: blur(10px);
        }

        .eyebrow-pulse {
            width: 6px; height: 6px;
            border-radius: 50%;
            background: var(--accent-color);
            box-shadow: 0 0 10px var(--accent-color);
            animation: pulse 2s infinite;
        }

        .about-hero h2 {
            font-size: 3.5rem;
            font-weight: 800;
            letter-spacing: -0.04em;
            line-height: 1.1;
            margin: 0 0 24px;
            background: linear-gradient(180deg, #ffffff 0%, #a1a1aa 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .about-hero p {
            font-size: 1.125rem;
            color: var(--text-muted);
            max-width: 600px;
            margin: 0 0 32px;
        }

        .hero-chips { 
            display: flex; 
            flex-wrap: wrap; 
            justify-content: center;
            gap: 12px; 
        }
        
        .hero-chip {
            font-size: 0.8rem;
            font-weight: 500;
            padding: 8px 20px;
            border-radius: 999px;
            border: 1px solid var(--border-color);
            color: var(--text-muted);
            background: rgba(255, 255, 255, 0.02);
            transition: var(--transition);
        }
        .hero-chip:hover {
            color: #fff;
            border-color: var(--border-hover);
            background: rgba(255, 255, 255, 0.08);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.5);
        }

        /* ═══════════════════════════════════════════
           STATS BENTO GRID
        ═══════════════════════════════════════════ */
        .about-stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            margin-bottom: 48px;
            position: relative;
            z-index: 1;
        }

        .about-stat {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-lg);
            padding: 32px 24px;
            text-align: center;
            transition: var(--transition);
            cursor: default;
        }

        .about-stat:hover {
            border-color: var(--border-hover);
            transform: translateY(-4px) scale(1.02);
            background: var(--bg-card-hover);
            box-shadow: 0 12px 30px rgba(0,0,0,0.5);
        }

        .stat-number {
            display: block;
            font-size: 2.5rem;
            font-weight: 700;
            color: #ffffff;
            letter-spacing: -0.04em;
            margin-bottom: 8px;
        }

        .stat-label {
            font-size: 0.75rem;
            font-weight: 500;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.1em;
        }

        /* ═══════════════════════════════════════════
           SECTION LABEL
        ═══════════════════════════════════════════ */
        .sec-label {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-bottom: 24px;
            position: relative;
            z-index: 1;
        }
        .sec-label-text {
            font-size: 0.85rem;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--text-main);
        }
        .sec-label-line { 
            flex: 1; height: 1px; 
            background: linear-gradient(90deg, var(--border-color), transparent); 
        }

        /* ═══════════════════════════════════════════
           FEATURE CARDS
        ═══════════════════════════════════════════ */
        .feat-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 16px;
            margin-bottom: 48px;
            position: relative;
            z-index: 1;
        }

        .feat-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-lg);
            padding: 24px;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }
        
        .feat-card:hover {
            border-color: var(--border-hover);
            background: var(--bg-card-hover);
            transform: translateY(-4px);
            box-shadow: 0 16px 32px rgba(0,0,0,0.6);
        }

        /* Subtle glowing dot on hover */
        .feat-card::before {
            content: "";
            position: absolute;
            top: 0; left: 24px; right: 24px;
            height: 1px;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            opacity: 0;
            transition: var(--transition);
        }
        .feat-card:hover::before { opacity: 1; }

        .feat-icon {
            width: 40px; height: 40px;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-color);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            transition: transform 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
        }
        
        /* Icon Interaction on Card Hover */
        .feat-card:hover .feat-icon {
            transform: scale(1.1) rotate(5deg);
            background: rgba(255, 255, 255, 0.1);
        }

        .feat-icon svg { width: 20px; height: 20px; stroke: currentColor; }
        
        .feat-title { font-size: 1rem; font-weight: 600; color: var(--text-main); margin-bottom: 8px; }
        .feat-sub   { font-size: 0.875rem; color: var(--text-muted); line-height: 1.5; }

        /* ═══════════════════════════════════════════
           TECH PILLS
        ═══════════════════════════════════════════ */
        .tech-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 48px;
            position: relative;
            z-index: 1;
        }
        
        .tech-pill {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px 20px;
            border-radius: var(--radius-md);
            border: 1px solid var(--border-color);
            background: var(--bg-card);
            font-size: 0.85rem;
            font-weight: 500;
            color: var(--text-muted);
            transition: var(--transition);
            cursor: pointer;
        }
        
        .tech-pill:hover { 
            color: var(--text-main);
            border-color: var(--border-hover);
            background: var(--bg-card-hover);
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.5);
        }
        
        .tech-dot { 
            width: 8px; height: 8px; 
            border-radius: 50%; 
            background: currentColor;
            opacity: 0.8;
            transition: var(--transition);
        }
        
        .tech-pill:hover .tech-dot {
            box-shadow: 0 0 8px currentColor;
        }

        /* ═══════════════════════════════════════════
           OBJECTIVE CARD (Wide Bento)
        ═══════════════════════════════════════════ */
        .objective-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-lg);
            padding: 32px;
            margin-bottom: 48px;
            position: relative;
            z-index: 1;
            text-align: center;
            transition: var(--transition);
        }

        .objective-card:hover {
            border-color: var(--border-hover);
            background: var(--bg-card-hover);
            transform: translateY(-2px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.4);
        }

        .objective-card p {
            font-size: 1.05rem;
            color: var(--text-muted);
            margin: 0;
            line-height: 1.8;
        }

        /* ═══════════════════════════════════════════
           FOOTER
        ═══════════════════════════════════════════ */
        .about-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-top: 32px;
            border-top: 1px solid var(--border-color);
            position: relative;
            z-index: 1;
        }
        .footer-tags { display: flex; gap: 12px; }
        .footer-tag {
            font-size: 0.75rem;
            font-weight: 500;
            padding: 4px 12px;
            border-radius: 6px;
            background: rgba(255,255,255,0.05);
            color: var(--text-muted);
            transition: var(--transition);
        }
        .footer-tag:hover {
            color: #fff;
            background: rgba(255,255,255,0.1);
        }
        .about-version { font-size: 0.8rem; color: var(--text-muted); }

        /* ═══════════════════════════════════════════
           ANIMATIONS & RESPONSIVE
        ═══════════════════════════════════════════ */
        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50%      { opacity: 0.4; }
        }

        @media (max-width: 768px) {
            .about-hero h2 { font-size: 2.5rem; }
            .about-stats { grid-template-columns: repeat(2, 1fr); }
            .feat-grid { grid-template-columns: 1fr; }
            .about-page { padding: 24px; margin: 0; border-radius: 0; }
        }
    </style>

    <div class="about-page">

        <!-- HERO -->
        <div class="about-hero">
            <div class="about-eyebrow">
                <div class="eyebrow-pulse"></div>
                v2.0 Architecture
            </div>
            <h2>Student Course<br>Enrollment System</h2>
            <p>A centralized, high-performance platform engineered for students to seamlessly manage course registrations, track financial statements, and maintain academic records.</p>
            <div class="hero-chips">
                <span class="hero-chip">ASP.NET Web Forms</span>
                <span class="hero-chip">C# Backend</span>
                <span class="hero-chip">SQL Server</span>
                <span class="hero-chip">Bootstrap</span>
            </div>
        </div>

        <!-- STATS -->
        <div class="about-stats">
            <div class="about-stat">
                <span class="stat-number">7</span>
                <span class="stat-label">Modules</span>
            </div>
            <div class="about-stat">
                <span class="stat-number">4</span>
                <span class="stat-label">Core Tools</span>
            </div>
            <div class="about-stat">
                <span class="stat-number">1</span>
                <span class="stat-label">Platform</span>
            </div>
            <div class="about-stat">
                 <span class="stat-number"><asp:Label ID="lblStudentCount" runat="server"></asp:Label></span>
                 <span class="stat-label">Students</span>
            </div>
        </div>

        <!-- FEATURES -->
        <div class="sec-label">
            <span class="sec-label-text">Key Features</span>
            <div class="sec-label-line"></div>
        </div>
        <div class="feat-grid">
            <div class="feat-card">
                <div class="feat-icon" style="color: #7c3aed;">
                    <svg fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                        <circle cx="12" cy="8" r="4"/><path d="M4 20c0-4 3.6-7 8-7s8 3 8 7"/>
                    </svg>
                </div>
                <div class="feat-title">Login &amp; Authentication</div>
                <div class="feat-sub">Secure student sign-in with encrypted credential validation and session handling.</div>
            </div>
            <div class="feat-card">
                <div class="feat-icon" style="color: #0ea5e9;">
                    <svg fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                        <rect x="3" y="4" width="18" height="16" rx="2"/><path d="M8 4v4M16 4v4M3 10h18"/>
                    </svg>
                </div>
                <div class="feat-title">Course Enrollment</div>
                <div class="feat-sub">Browse available modules and seamlessly register for courses in real-time.</div>
            </div>
            <div class="feat-card">
                <div class="feat-icon" style="color: #ec4899;">
                    <svg fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                        <path d="M12 5v14M5 12h14"/>
                    </svg>
                </div>
                <div class="feat-title">Add / Drop Courses</div>
                <div class="feat-sub">Manage your academic schedule flexibly with instant database synchronization.</div>
            </div>
            <div class="feat-card">
                <div class="feat-icon" style="color: #f59e0b;">
                    <svg fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                        <rect x="2" y="5" width="20" height="14" rx="2"/><path d="M2 10h20"/>
                    </svg>
                </div>
                <div class="feat-title">Payment Management</div>
                <div class="feat-sub">Track tuition fees, process financial transactions, and maintain payment ledgers.</div>
            </div>
            <div class="feat-card">
                <div class="feat-icon" style="color: #10b981;">
                    <svg fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
                    </svg>
                </div>
                <div class="feat-title">Profile Controls</div>
                <div class="feat-sub">Update personal information, manage passwords, and configure account settings.</div>
            </div>
            <div class="feat-card">
                <div class="feat-icon" style="color: #6366f1;">
                    <svg fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                        <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/>
                    </svg>
                </div>
                <div class="feat-title">Enquiry Submission</div>
                <div class="feat-sub">Send direct queries and support requests to system administrators instantly.</div>
            </div>
            <div class="feat-card">
                <div class="feat-icon" style="color: #f43f5e;">
                    <svg fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                        <polyline points="14 2 14 8 20 8"/>
                        <line x1="16" y1="13" x2="8" y2="13"/>
                        <line x1="16" y1="17" x2="8" y2="17"/>
                    </svg>
                </div>
                <div class="feat-title">Academic Statements</div>
                <div class="feat-sub">View and generate detailed historical records of courses and payment history.</div>
            </div>
        </div>

        <!-- TECHNOLOGIES -->
        <div class="sec-label">
            <span class="sec-label-text">Technologies Used</span>
            <div class="sec-label-line"></div>
        </div>
        <div class="tech-grid">
            <div class="tech-pill">
                <div class="tech-dot" style="color: #7c3aed;"></div> ASP.NET Web Forms
            </div>
            <div class="tech-pill">
                <div class="tech-dot" style="color: #0ea5e9;"></div> C# Programming
            </div>
            <div class="tech-pill">
                <div class="tech-dot" style="color: #f59e0b;"></div> SQL Server (LocalDB)
            </div>
            <div class="tech-pill">
                <div class="tech-dot" style="color: #10b981;"></div> HTML, CSS, Bootstrap
            </div>
        </div>

        <!-- OBJECTIVE -->
        <div class="sec-label">
            <span class="sec-label-text">Objective</span>
            <div class="sec-label-line"></div>
        </div>
        <div class="objective-card">
            <p>To provide a user-friendly interface for students to manage course registration, payments, and personal information in an efficient and centralized manner.</p>
        </div>

        <!-- FOOTER -->
        <div class="about-footer">
            <div class="footer-tags">
                <span class="footer-tag">Academic Project</span>
                <span class="footer-tag">v 1.0</span>
                <span class="footer-tag">ASP.NET</span>
            </div>
            <span class="about-version">Student Course Enrollment System</span>
        </div>

    </div>
</asp:Content>