<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Busqueda por Nombre</title>
    <style>
        table.table thead {
            background-color: LightSteelBlue;
            color: bla;
        }
        table.table tbody{
            background-color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Primer Nombre</th>
                        <th>Primer Apellido</th>
                        <th>Correo</th>
                        <th>Nacimiento</th>
                        <th>Edad</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    include '../Conf/Conexion.php';

                    if (isset($_POST['busqueda'])) {
                      $busqueda = $_POST['busqueda'];

                      $query = "SELECT identificacion, primer_nombre,primer_apellido, correo, nacimiento, edad FROM amigos WHERE primer_nombre LIKE '%$busqueda%'";
                      $resultado = $conexion->query($query);

                      while ($fila = $resultado->fetch_assoc()) {
                        echo '<tr>';
                        echo '<td>' . $fila['identificacion'] . '</td>';
                        echo '<td>' . $fila['primer_nombre'] . '</td>';
                        echo '<td>' . $fila['primer_apellido'] . '</td>';
                        echo '<td>' . $fila['correo'] . '</td>';
                        echo '<td>' . $fila['nacimiento'] . '</td>';
                        echo '<td>' . $fila['edad'] . '</td>';
                        echo '</tr>';
                      }
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
