-- Schema: Computer firm

-- Find all records from the Printer table containing data about color printers.

SELECT code, model, color, type, price
FROM printer
WHERE color = 'y'
