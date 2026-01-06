<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Set New Password | Hirehub</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style.css">

        <style>
            body { 
                background: linear-gradient(90deg,#0d6efd,#6610f2); 
                min-height:100vh; 
                display:flex; 
                flex-direction:column; 
            }
            .reset-box { 
                background:#fff; 
                padding:32px; 
                border-radius:12px; 
                max-width:520px; 
                width:100%; 
                box-shadow:0 12px 30px rgba(0,0,0,0.14); 
            
            }
            .reset-box h3{ 
                text-align:center; 
                margin-bottom:8px; 
                font-weight:700 
            }
            .help { 
                text-align:center; 
                color:#6c757d; 
                margin-bottom:14px 
            }
            .btn-reset{ 
                width:100%; 
                padding:10px 14px; 
                font-weight:600 
            }
            .pw-toggle{ 
                cursor:pointer; 
                color:#0d6efd; }
            .msg { 
                text-align:center; 
                margin-bottom:12px; 
                font-weight:500 
            }
            .error{ 
                color:#c92a2a 
            }
            .success{ 
                color:#2b8a3e 
            }
            @media (max-width:420px){ 
                .reset-box{
                    padding:20px
                } 
            }
        </style>

        <script>
            function togglePassword(id, toggleId){
                const inp = document.getElementById(id);
                const t = document.getElementById(toggleId);
                if(inp.type === 'password'){ inp.type = 'text'; t.textContent = 'Hide'; }
                else { inp.type = 'password'; t.textContent = 'Show'; }
            }

            function validateAndSubmit(e){
                e.preventDefault();
                const pw = document.getElementById('newPassword').value.trim();
                const cpw = document.getElementById('confirmPassword').value.trim();
                const err = document.getElementById('errMsg');
                err.textContent = '';
                if(pw.length < 8){ err.textContent = 'Password must be at least 8 characters.'; return; }
                if(pw !== cpw){ err.textContent = 'Passwords do not match.'; return; }
                // Submit
                document.getElementById('resetForm').submit();
            }

            document.addEventListener('DOMContentLoaded', ()=>{ document.getElementById('resetForm').addEventListener('submit', validateAndSubmit); });
        </script>
    </head>
    
    <body>
        <jsp:include page="header.jsp" />

        <main class="d-flex align-items-center justify-content-center" style="min-height:calc(100vh - 160px); padding:24px;">
            <div class="reset-box">

                <h3>Set New Password</h3>
                <p class="help">Choose a strong password you haven't used elsewhere.</p>

                        
                <c:set var="tempEmail" value="${tempEmail}"/>

                <form id="resetForm" action="resetPassword" method="post">
                    <div class="mb-3">
                        <label for="newPassword" class="form-label">New Password</label>
                        <div class="input-group">
                            <input id="newPassword" name="newPassword" type="password" class="form-control" placeholder="Enter new password" required>
                            <span class="input-group-text pw-toggle" id="toggleNew" onclick="togglePassword('newPassword','toggleNew')">Show</span>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <div class="input-group">
                            <input id="confirmPassword" name="confirmPassword" type="password" class="form-control" placeholder="Re-enter new password" required>
                            <span class="input-group-text pw-toggle" id="toggleConfirm" onclick="togglePassword('confirmPassword','toggleConfirm')">Show</span>
                        </div>
                    </div>

                    <p id="errMsg" class="error" style="min-height:18px"></p>

                    <button type="submit" class="btn btn-primary btn-reset">Set Password</button>
                </form>

                <div class="help" style="margin-top:12px"><a href="login.jsp" class="text-decoration-none">← Back to Login</a></div>
            </div>
        </main>

        <jsp:include page="footer.jsp" />

    </body>
</html>