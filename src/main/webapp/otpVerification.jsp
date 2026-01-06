<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Verify OTP | Hirehub</title>
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
            .verify-box { 
                background:#fff; 
                padding:32px; 
                border-radius:12px; 
                max-width:520px; 
                width:100%; 
                box-shadow:0 12px 30px rgba(0,0,0,0.15); 
            }
            .verify-box h3 { 
                text-align:center; 
                margin-bottom:10px; 
                font-weight:700; 
            }
            .otp-row { display:flex; 
                gap:10px; 
                justify-content:center; 
                margin:18px 0 8px; 
            }
            .otp-input { 
                width:56px; 
                height:56px; 
                text-align:center; 
                font-size:1.25rem; 
                border-radius:8px; 
                border:1px solid #e6e6e6; 
            }
            .otp-input:focus { 
                outline:2px solid rgba(13,110,253,0.18); 
                border-color:#0d6efd; 
                box-shadow:0 4px 18px rgba(13,110,253,0.12); 
            }
            .helper { text-align:center; 
                color:#666; 
                font-size:0.95rem; 
                margin-top:6px; 
            }
            .btn-verify { 
                width:100%; 
                padding:10px 14px; 
                font-weight:600; 
            }
            @media (max-width:420px){ 
                .otp-input{
                    width:46px;
                    height:46px;
                    font-size:1.05rem
                } 
                .verify-box{
                    padding:20px
                } 
            }
        </style>

        <script>
            // Small helper to manage digit inputs
            function setupOtpInputs(){
                const inputs = Array.from(document.querySelectorAll('.otp-input'));
                inputs.forEach((input, idx) => {
                    input.addEventListener('input', e => {
                        const val = e.target.value.replace(/[^0-9]/g,'');
                        e.target.value = val.slice(0,1);
                        if(val && idx < inputs.length-1) inputs[idx+1].focus();
                    });
                    input.addEventListener('keydown', e => {
                        if(e.key === 'Backspace' && !e.target.value && idx>0){ inputs[idx-1].focus(); }
                        if(e.key === 'ArrowLeft' && idx>0) inputs[idx-1].focus();
                        if(e.key === 'ArrowRight' && idx<inputs.length-1) inputs[idx+1].focus();
                    });
                    input.addEventListener('paste', e => {
                        e.preventDefault();
                        const paste = (e.clipboardData || window.clipboardData).getData('text');
                        const digits = paste.replace(/\D/g,'').slice(0, inputs.length).split('');
                        digits.forEach((d,i)=> inputs[i].value = d);
                    });
                });
            }
            function submitOtpForm(e){
                e.preventDefault();
                const inputs = Array.from(document.querySelectorAll('.otp-input'));
                const otp = inputs.map(i=>i.value||'').join('');
                if(otp.length < inputs.length){
                    alert('Please enter the complete OTP');
                    return;
                }
                // set hidden input and submit
                document.getElementById('otpHidden').value = otp;
                e.target.submit();
            }
            document.addEventListener('DOMContentLoaded', ()=>{ setupOtpInputs(); document.getElementById('otpForm').addEventListener('submit', submitOtpForm); });
        </script>
    </head>
    
    <body>
        <jsp:include page="header.jsp" />

        <main class="d-flex align-items-center justify-content-center" style="min-height:calc(100vh - 160px); padding:24px;">
            <div class="verify-box">

                <c:set var="from" value="${from}"/>
                <c:set var="tempEmail" value="${tempEmail}"/>

                <h3>Verify OTP</h3>
                <p class="helper">Enter the 6-digit code sent to your email.</p>

                <c:if test="${wrongOtp}">
                    <p class="alert alert-danger" style="text-align: center;">Incorrect OTP</p>
                    <c:remove var="wrongOtp"/>
                </c:if>

                <c:if test="${otpSend}">
                    <p class="alert alert-success" style="text-align: center;" >OTP sent! Please check your mail</p>
                    <c:remove var="otpSend"/>
                </c:if>

                <form id="otpForm" action="verifyOtpServlet" method="post">
                    <div class="otp-row">
                        <input class="otp-input" inputmode="numeric" maxlength="1" />
                        <input class="otp-input" inputmode="numeric" maxlength="1" />
                        <input class="otp-input" inputmode="numeric" maxlength="1" />
                        <input class="otp-input" inputmode="numeric" maxlength="1" />
                        <input class="otp-input" inputmode="numeric" maxlength="1" />
                        <input class="otp-input" inputmode="numeric" maxlength="1" />
                    </div>
                    <input type="hidden" id="otpHidden" name="otp" />
                    <button type="submit" class="btn btn-primary btn-verify">Verify OTP</button>
                </form>

                <form action="resendOTPServlet" method="post" class="helper" style="margin-top:12px">
                    <input type="hidden" name="from" value="otpVerification.jsp" />
                    <button type="submit" class="btn" style="color: red;">Resend code</a>
                </frorm>
            </div>
        </main>

        <jsp:include page="footer.jsp" />
        
    </body>
</html>