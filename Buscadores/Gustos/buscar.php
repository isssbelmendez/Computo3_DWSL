<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Busqueda por Gustos</title>
    <style>
        table.table thead {
            background-color: LightSteelBlue;
        }

        table.table tbody {
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
                        <th>Gusto</th>
                        <th>Primer Nombre</th>
                        <th>Segundo Nombre</th>
                        <th>País</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    include '../Conf/Conexion.php';

                    if (isset($_POST['busqueda'])) {
                        $busqueda = $_POST['busqueda'];
                        $query = "SELECT amigos.primer_nombre, amigos.segundo_nombre, amigos.pais, gustos.nombre 
                        FROM amigos 
                        INNER JOIN gustosxamigos ON amigos.identificacion = gustosxamigos.identificacion
                        INNER JOIN gustos ON gustosxamigos.id_gusto = gustos.id
                        WHERE gustos.nombre LIKE '%$busqueda%'";

                        $resultado = $conexion->query($query);

                        while ($fila = $resultado->fetch_assoc()) {
                            echo '<tr>';
                            echo '<td>' . $fila['nombre'] . '</td>';
                            echo '<td>' . $fila['primer_nombre'] . '</td>';
                            echo '<td>' . $fila['segundo_nombre'] . '</td>';
                            echo '<td>' . $fila['pais'] . '</td>';
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