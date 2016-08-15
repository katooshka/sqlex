-- Schema: Computer firm

-- Get the makers producing both PCs having a speed of 750 MHz or higher and laptops with a speed of 750 MHz or higher.
-- Result set: makerGet the makers producing both PCs having a speed of 750 MHz or higher and laptops with a speed of 750 MHz or higher.
-- Result set: maker

SELECT maker
FROM product JOIN pc ON product.model = pc.model
WHERE speed >= 750

INTERSECT

SELECT maker
FROM product JOIN laptop ON product.model = laptop.model
WHERE speed >= 750

