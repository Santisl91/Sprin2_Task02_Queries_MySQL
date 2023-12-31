SELECT nombre FROM tienda.producto;
SELECT nombre, precio FROM tienda.producto;
SELECT * FROM tienda.producto;
SELECT nombre, precio AS precio_en_euros, precio * 1.2 AS precio_en_dolares FROM tienda.producto;
SELECT nombre AS "product name", precio AS "euros", precio * 1.2 AS "dollar" FROM tienda.producto;
SELECT UPPER(nombre) AS "Upercase Name", precio FROM producto;
SELECT LOWER(nombre) AS "Upercase Name", precio FROM producto;
SELECT nombre AS "Manufacture Name", UPPER(SUBSTRING(nombre, 1, 2)) AS "Lowercase Inicials" FROM tienda.fabricante;
SELECT nombre, ROUND(precio, 2) AS "Rounding price" FROM tienda.producto;
SELECT nombre, CAST(precio AS SIGNED) AS "Truncating price" FROM tienda.producto;
SELECT fabricante.codigo FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT DISTINCT fabricante.codigo FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre FROM producto ORDER BY nombre ASC;
SELECT nombre FROM producto ORDER BY precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT producto.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.codigo = 2;
SELECT producto.nombre AS 'Nombre Producto', producto.precio, fabricante.nombre AS 'Nombre Fabricante' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;	
SELECT producto.nombre AS 'Nombre Producto', producto.precio, fabricante.nombre AS 'Nombre Fabricante' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;	
SELECT producto.codigo AS 'Codigo Producto', producto.nombre AS 'Nombre Producto', fabricante.codigo AS 'Codigo Fabricante', fabricante.nombre AS 'Nombre Fabricante' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;	
SELECT producto.nombre AS 'Nombre Producto', producto.precio, fabricante.nombre AS 'Nombre Fabricante' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio LIMIT 1;	
SELECT producto.nombre AS 'Nombre Producto', producto.precio, fabricante.nombre AS 'Nombre Fabricante' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC LIMIT 1;	
SELECT producto.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'lenovo';
SELECT producto.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'crucial' AND producto.precio > 200;
SELECT producto.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'seagate';
SELECT producto.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('asus', 'Hewlett-Packard', 'seagate');
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e' OR fabricante.nombre LIKE '%E';
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%' OR fabricante.nombre LIKE '%W%';
SELECT producto.nombre As 'Nombre Producto', producto.precio AS 'Precio Producto', fabricante.nombre AS 'Nombre Fabricante' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC;
SELECT producto.nombre As 'Nombre Producto', producto.precio AS 'Precio Producto', fabricante.nombre AS 'Nombre Fabricante' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio;
SELECT * FROM fabricante WHERE EXISTS (SELECT 1 FROM producto WHERE producto.codigo_fabricante = fabricante.codigo);
SELECT fabricante.nombre AS 'Nombre Fabricante', producto.nombre AS 'Nombre Producto' FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT * FROM fabricante WHERE NOT EXISTS (SELECT 1 FROM producto WHERE producto.codigo_fabricante = fabricante.codigo);
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'lenovo');
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo') AND precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard') AND precio = (SELECT MIN(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard'));
SELECT nombre FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo')) AND codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus') AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));

