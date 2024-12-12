<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reset PIN</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: linear-gradient(135deg, #74b9ff, #a29bfe);
                font-family: 'Arial', sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
                }

               .container {
               max-width: 450px;
               background: #ffffff;
               padding: 30px;
               border-radius: 15px;
               box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
               text-align: center;
               }
               
              .icon {
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #0984e3;
                color: #ffffff;
                width: 80px;
                height: 80px;
                border-radius: 50%;
                margin: -50px auto 15px;
                box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
            }

            .form-header h2 {
                font-size: 28px;
                color: #2d3436;
                margin-bottom: 20px;
            }

            .form-control {
                border-radius: 8px;
                margin-bottom: 20px;
                /* Add spacing between form inputs */
                padding: 12px;
            }

            .btn-custom {
                background-color: #0984e3;
                color: white;
                border: none;
                border-radius: 50px;
                padding: 12px 24px;
                font-size: 16px;
                font-weight: bold;
                text-transform: uppercase;
                letter-spacing: 1px;
                transition: all 0.3s ease;
                width: 100%;
                cursor: pointer;
                box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 15px;
                /* Add gap between buttons */
            }

            .btn-custom:hover {
                background-color: #0652dd;
                transform: translateY(-3px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
            }

            .btn-custom:active {
                background-color: #04499e;
                transform: translateY(1px);
                box-shadow: none;
            }

            .btn-custom a {
                color: white;
                text-decoration: none;
            }

            .btn-custom a:hover {
                text-decoration: none;
            }

            .back-to-login {
                margin-top: 20px;
                text-align: center;
            }

            .back-to-login a {
                display: inline-block;
                padding: 12px 24px;
                background-color: #e17055;
                color: white;
                border-radius: 50px;
                text-decoration: none;
                font-weight: bold;
                transition: all 0.3s ease;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .back-to-login a:hover {
                background-color: #d35400;
                transform: translateY(-3px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
            }

            .back-to-login a:active {
                background-color: #c0392b;
                transform: translateY(1px);
                box-shadow: none;
            }

            .sucs,
            .fail {
                text-align: center;
                font-weight: bold;
                font-size: 16px;
            }

            .sucs {
                color: green;
            }

            .fail {
                color: red;
            }
        </style>


    </head>

    <body>

        <div class="container">
            <div class="icon">
                <i class="bi bi-key" style="font-size: 30px;">🔑</i>
            </div>
            <div class="form-header">
                <h2>Reset PIN</h2>
            
            <%String Success=(String)request.getAttribute("resetsuccuess");%>
            <%if(Success!=null){%>
            <h3 class="sucs"><%=Success%></h3>
            <%} %>

            <%String Failure=(String)request.getAttribute("resetfailed");%>
            <%if(Failure!=null){%>
            <h3 class="fail"><%=Failure%></h3>
            <%} %>

            <%String Fail=(String)request.getAttribute("resetfail");%>
            <%if(Fail!=null){%>
            <h3 class="fail"><%=Fail%></h3>
            <%} %>
 
</div>
<form action="resetPin" method="post">

    <!-- Phone -->
    <div class="mb-3">
        <label for="newPin" class="form-label">Phone</label>
        <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" required>
    </div>

    <!-- New PIN -->
    <div class="mb-3">
        <label for="newPin" class="form-label">New PIN</label>
        <input type="password" class="form-control" id="newPin" name="newPin" placeholder="Enter new PIN" required>
    </div>

    <!-- Confirm New PIN -->
    <div class="mb-3">
        <label for="confirmPin" class="form-label">Confirm New PIN</label>
        <input type="password" class="form-control" id="confirmPin" name="confirmPin" placeholder="Confirm new PIN" required>
    </div>

    <div class="button-group">
        <button type="submit" class="btn btn-custom">Reset PIN</button>
        <a href="Dashboard.jsp"><button type="button" class="btn btn-custom">Cancel</button></a>
    </div>
</form>

      <div class="back-to-login">
          <a href="Login.jsp">Back to Login</a>
      </div>
      
</div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>