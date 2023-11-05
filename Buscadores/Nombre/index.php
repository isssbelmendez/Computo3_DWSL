<?php
include '../Conf/Conexion.php';
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SocialCircle</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>

<body style="background-color: burlywood;">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">SocialCircle</a>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <form action="" method="POST">
                    <div class="form-row">
                        <div class="col-2">
                            <label for="Nombre" class="col-form-label">Nombre:</label>
                        </div>
                        <div class="col-7">
                            <input type="text" id="busqueda" class="form-control" placeholder="Buscar">
                        </div>
                        <div class="col-3">
                            <button class="btn btn-primary" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <br>
    <div id="resultados"></div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#busqueda').on('input', function() {
                var texto = $(this).val();
                if (texto !== '') {
                    // Realiza una solicitud AJAX 
                    $.ajax({
                        url: 'buscar.php',
                        method: 'POST',
                        data: {
                            busqueda: texto
                        },
                        success: function(data) {
                            $('#resultados').html(data);
                        }
                    });
                }
            });
        });
    </script>
</body>

</html>