# EXPLAIN Before                                                                                |
+-------------------------------------------------------------------------------------------+
| -> Table scan on Booking  (cost=0.45 rows=2) (actual time=0.0379..0.0483 rows=3 loops=1) |
+-------------------------------------------------------------------------------------------+

# EXPLAIN  After                                                                                 |
+-------------------------------------------------------------------------------------------+
| -> Table scan on Booking  (cost=0.45 rows=2) (actual time=0.0291..0.0353 rows=3 loops=1)
 |
+-------------------------------------------------------------------------------------------+