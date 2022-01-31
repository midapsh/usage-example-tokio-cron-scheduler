import pandas as pd



df = pd.read_csv("cpu.csv")

import plotly.graph_objects as go

fig = go.Figure()

# Add traces
fig.add_trace(go.Scatter(x=df["date"], y=df["CPU(%)"],
                    mode="lines",
                    name="CPU(%)"))
fig.add_trace(go.Scatter(x=df["date"], y=df["RAM(%)"],
                    mode="lines",
                    name="RAM(%)"))
fig.add_trace(go.Scatter(x=df["date"], y=df["Swap(%)"],
                    mode="lines",
                    name="Swap(%)"))
fig.add_trace(go.Scatter(x=df["date"], y=df["HDD(%)"],
                    mode="lines",
                    name="HDD(%)"))
fig.update_layout(hovermode="x")
fig.show()

#########
# Histogram

fig = go.Figure()

# Add traces
fig.add_trace(go.Histogram(x=df["CPU(%)"],
                    name="CPU(%)"))
fig.add_trace(go.Histogram(x=df["RAM(%)"],
                    name="RAM(%)"))
fig.add_trace(go.Histogram(x=df["Swap(%)"],
                    name="Swap(%)"))
fig.add_trace(go.Histogram(x=df["HDD(%)"],
                    name="HDD(%)"))
fig.update_layout(hovermode="x")
fig.show()

