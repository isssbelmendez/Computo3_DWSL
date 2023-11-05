<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Busqueda por Ubicación</title>
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
                        <th>Pais</th>
                        <th>Provincia</th>
                        <th>Canton</th>
                        <th>Distrito</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    include '../Conf/Conexion.php';

                    if (isset($_POST['busqueda'])) {
                      $busqueda = $_POST['busqueda'];

                      $query = "SELECT identificacion, pais, provincia, canton,distrito ,primer_nombre,primer_apellido FROM amigos WHERE pais LIKE '%$busqueda%' OR provincia LIKE '%$busqueda%' OR canton LIKE '%$busqueda%' OR distrito LIKE '%$busqueda%'";
                      $resultado = $conexion->query($query);

                      while ($fila = $resultado->fetch_assoc()) {
                        echo '<tr>';
                        echo '<td>' . $fila['identificacion'] . '</td>';
                        echo '<td>' . $fila['pais'] . '</td>';
                        echo '<td>' . $fila['provincia'] . '</td>';
                        echo '<td>' . $fila['canton'] . '</td>';
                        echo '<td>' . $fila['distrito'] . '</td>';
                        echo '<td>' . $fila['primer_nombre'] . '</td>';
                        echo '<td>' . $fila['primer_apellido'] . '</td>';
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
