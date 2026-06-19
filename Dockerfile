FROM python:3.11-slim

WORKDIR /dbt_snowflake

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY lonestar_edw/ ./lonestar_edw/

COPY run_dbt.sh .
RUN chmod +x run_dbt.sh

CMD ["./run_dbt.sh"]
