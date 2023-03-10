<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabla con Tailwind CSS</title>
    <!-- Importamos los estilos de Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>

</head>
<body class="bg-gray-200">
    <div class="container mx-auto py-8">
        <h1 class="text-2xl font-bold text-center mb-8">Tabla de datos</h1>
        <div class="overflow-x-auto">
            <table class="w-full bg-white shadow-md rounded-lg">
                <thead>
                    <tr class="text-md font-semibold tracking-wide text-left text-gray-900 bg-blue-200 uppercase border-b border-gray-600">
                        <th class="px-4 py-3"></th>
                        <th class="px-4 py-3">FolderId</th>
                        <th class="px-4 py-3">AccessType</th>
                        <th class="px-4 py-3">EmpName</th>
                        <th class="px-4 py-3">DeptName</th>
                        <th class="px-4 py-3">CountryName</th>
                        <th class="px-4 py-3">Continent</th>
                    </tr>
                </thead>
                <tbody class="bg-white">
                    <?php
                    // Realizamos la conexión a la base de datos
                    include "conexion.php";
                    $con = conectar();

                    // Realizamos la consulta a la base de datos
                    $sql = "SELECT F.FolderId, F.AccessType, E.EmpName, D.DepName, C.CountryName, C.Continent
                            FROM FOLDER AS F
                            JOIN EMPLOYEE AS E ON F.EmpId = E.EmpID
                            JOIN DEPARTMENT AS D ON E.DeptId = D.DepartmentId
                            JOIN COUNTRY AS C ON D.CountryId = C.CountryId";
                    $query = mysqli_query($con, $sql);
                    $contador =1;
                    // Recorremos los resultados de la consulta y los mostramos en la tabla
                    while ($row = mysqli_fetch_array($query)) {
                        echo "<tr class='border-b border-gray-200'>";
                        echo "<td class='px-4 py-3'>" . $contador . "</td>";
                        echo "<td class='px-4 py-3'>" . $row['FolderId'] . "</td>";
                        echo "<td class='px-4 py-3'>" . $row['AccessType'] . "</td>";
                        echo "<td class='px-4 py-3'>" . $row['EmpName'] . "</td>";
                        echo "<td class='px-4 py-3'>" . $row['DepName'] . "</td>";
                        echo "<td class='px-4 py-3'>" . $row['CountryName'] . "</td>";
                        echo "<td class='px-4 py-3'>" . $row['Continent'] . "</td>";
                        echo "</tr>";
                        $contador++;
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
