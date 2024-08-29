SELECT NombreCliente, RutCliente 
FROM Clientes 
WHERE RutCliente NOT IN (
    SELECT RutCliente 
    FROM Ventas
);

SELECT V.Folio, V.Fecha, V.Monto, C.NombreCliente, C.RutCliente
FROM Ventas V
JOIN Clientes C ON V.RutCliente = C.RutCliente;

SELECT V.Folio, V.Fecha, V.Monto, C.NombreCliente, C.RutCliente, A.Marca
FROM Ventas V
JOIN Clientes C ON V.RutCliente = C.RutCliente
JOIN Autos A ON V.AutoID = A.AutoID
WHERE A.Marca = (
    SELECT Marca 
    FROM Autos 
    JOIN Ventas ON Autos.AutoID = Ventas.AutoID
    GROUP BY Marca
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
