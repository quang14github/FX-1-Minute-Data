# FX 1-Minute Dataset

API and dataset download for [histdata.com](http://histdata.com).

## Download the dataset

- You can download the dataset (up to date) by yourself:

```bash
pip install -r requirements.txt
python download_all_fx_data.py
```

Expect it to take around 30 minutes if you have a fast internet connection.

## API

```
pip install histdata
```

### Examples

```python
from histdata import download_hist_data as dl
from histdata.api import Platform as P, TimeFrame as TF
```

- Download tick data for 2019/06:

```python
dl(year='2019', month='6', pair='eurusd', platform=P.GENERIC_ASCII, time_frame=TF.TICK_DATA)
```

- Other possible calls:

```python
dl(year='2019', month='6', pair='eurusd', platform=P.NINJA_TRADER, time_frame=TF.TICK_DATA_LAST)
dl(year='2019', month='6', pair='eurusd', platform=P.NINJA_TRADER, time_frame=TF.TICK_DATA_ASK)
dl(year='2019', month='6', pair='eurusd', platform=P.NINJA_TRADER, time_frame=TF.TICK_DATA_BID)
dl(year='2019', month='6', pair='eurusd', platform=P.NINJA_TRADER, time_frame=TF.ONE_MINUTE)
dl(year='2019', month='6', pair='eurusd', platform=P.GENERIC_ASCII, time_frame=TF.TICK_DATA)
dl(year='2019', month='6', pair='eurusd', platform=P.EXCEL, time_frame=TF.ONE_MINUTE)
dl(year='2019', month='6', pair='eurusd', platform=P.META_TRADER, time_frame=TF.ONE_MINUTE)
dl(year='2019', month='6', pair='eurusd', platform=P.META_STOCK, time_frame=TF.ONE_MINUTE)
dl(year='2018', month='6', pair='eurusd', platform=P.NINJA_TRADER, time_frame=TF.TICK_DATA_LAST)
dl(year='2018', month='6', pair='eurusd', platform=P.NINJA_TRADER, time_frame=TF.TICK_DATA_ASK)
dl(year='2018', month='6', pair='eurusd', platform=P.NINJA_TRADER, time_frame=TF.TICK_DATA_BID)
```

## Data specification

This repository contains:

- A dataset of 10 FX pairs (1-minute data) from 2000, in Generic ASCII.
- A set of functions to download the historical prices yourself.

All the data is retrieved from: http://www.histdata.com/

All files in a dataset are CSV (semicolon separated file).

Any CSV file looks like this:

```bash
20120201 000000;1.306600;1.306600;1.306560;1.306560;0
20120201 000100;1.306570;1.306570;1.306470;1.306560;0
20120201 000200;1.306520;1.306560;1.306520;1.306560;0
20120201 000300;1.306610;1.306610;1.306450;1.306450;0
20120201 000400;1.306470;1.306540;1.306470;1.306520;0
[...]
```

Headers are not included in the CSV files. They are:

```csv
DateTime Stamp;Bar OPEN Bid Quote;Bar HIGH Bid Quote;Bar LOW Bid Quote;Bar CLOSE Bid Quote;Volume
```

### DateTime Stamp

Format:
`YYYYMMDD HHMMSS`

Legend:

- YYYY – Year
- MM – Month (01 to 12)
- DD – Day of the Month
- HH – Hour of the day (in 24h format)
- MM – Minute
- SS – Second, in this case it will be always 00

TimeZone: Eastern Standard Time (EST) time-zone _WITHOUT_ Day Light Savings adjustments

### OPEN Bid Quote

The open (first) bid quote of the 1M bin.

### HIGH Bid Quote

The highest bid quote of the 1M bin.

### LOW Bid Quote

The lowest bid quote of the 1M bin.

### CLOSE Bid Quote

The close (last) bid quote of the 1M bin.

### Volume

Number of lots. Looks like it's always 0.
