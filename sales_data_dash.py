import dash
from dash import dcc, html, Input, Output
import dash_bootstrap_components as dbc
import plotly.express as px
import pandas as pd
from sqlalchemy import create_engine

# Connection l base de données b SQLAlchemy
engine = create_engine("mysql+mysqlconnector://root:root123@localhost/sales_data")

# Function bach nfetchiw les données
def fetch_data(query):
    # Fetch data b Pandas DataFrame
    df = pd.read_sql(query, engine)
    return df

# Initialize the app
app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

# Layout
app.layout = dbc.Container([
    dbc.NavbarSimple(
        children=[
            dbc.Button("Overview", id="btn-overview", color="primary", className="me-2"),
            dbc.Button("Products", id="btn-products", color="primary", className="me-2"),
            dbc.Button("Customers", id="btn-customers", color="primary", className="me-2"),
            dbc.Button("Employees & Shippers", id="btn-employees-shippers", color="primary"),
        ],
        brand="📊 Sales Analytics Dashboard",
        color="primary", dark=True, className="mb-4"
    ),
    html.Div(id="content")  # Div bach nbadlo l'interface
], fluid=True, style={"backgroundColor": "#ffffff", "color": "#000000"})  # Background bayda w texte noir

# Callback bach nbadlo l'interface
@app.callback(
    Output("content", "children"),
    Input("btn-overview", "n_clicks"),
    Input("btn-products", "n_clicks"),
    Input("btn-customers", "n_clicks"),
    Input("btn-employees-shippers", "n_clicks")
)
def update_content(btn1, btn2, btn3, btn4):
    # Check which button was clicked
    ctx = dash.callback_context
    if not ctx.triggered:
        button_id = "btn-overview"  # Default view
    else:
        button_id = ctx.triggered[0]["prop_id"].split(".")[0]

    # Return the appropriate layout based on the button clicked
    if button_id == "btn-overview":
        return overview_layout()
    elif button_id == "btn-products":
        return products_layout()
    elif button_id == "btn-customers":
        return customers_layout()
    elif button_id == "btn-employees-shippers":
        return employees_shippers_layout()

# Layouts for each section
def overview_layout():
    # Queries
    query_metrics = """
    SELECT 
        SUM(fo.total_price) AS total_sales,
        SUM(fo.profit) AS total_profit,
        (SUM(fo.total_price) - SUM(fo.Cost)) AS net_sales
    FROM fact_orders fo;
    """
    query_sales_trend = """
    SELECT dt.order_date, SUM(fo.total_price) AS total_sales
    FROM fact_orders fo
    JOIN dim_time dt ON fo.date_id = dt.date_id
    GROUP BY dt.order_date ORDER BY dt.order_date;
    """
    query_profit_margin = """
    SELECT dt.order_date, 
           SUM(fo.profit)/NULLIF(SUM(fo.total_price), 0) AS profit_margin
    FROM fact_orders fo
    JOIN dim_time dt ON fo.date_id = dt.date_id
    GROUP BY dt.order_date ORDER BY dt.order_date;
    """

    # Fetch data
    df_metrics = fetch_data(query_metrics)
    df_sales_trend = fetch_data(query_sales_trend)
    df_profit_margin = fetch_data(query_profit_margin)

    # Layout
    return html.Div([
        html.H2("📈 Overview", style={
            "textAlign": "center",
            "color": "#2c3e50",
            "fontSize": "2.5rem",
            "fontWeight": "bold",
            "marginBottom": "20px",
            "padding": "10px",
            "background": "linear-gradient(90deg, #1f77b4, #ff7f0e, #2ca02c)",
            "WebkitBackgroundClip": "text",
            "WebkitTextFillColor": "transparent",
            "borderBottom": "3px solid #1f77b4",
            "display": "inline-block"
        }),
        dbc.Row([
            dbc.Col(dbc.Card([
                dbc.CardBody([
                    html.H5("Total Sales", className="card-title", style={"color": "#000000"}),
                    html.H3(f"${df_metrics['total_sales'][0]:,.2f}", style={"color": "#1f77b4"})
                ])
            ], style={"backgroundColor": "#f8f9fa", "border": "2px solid #1f77b4", "borderRadius": "10px"}), width=4),
            dbc.Col(dbc.Card([
                dbc.CardBody([
                    html.H5("Total Profit", className="card-title", style={"color": "#000000"}),
                    html.H3(f"${df_metrics['total_profit'][0]:,.2f}", style={"color": "#ff7f0e"})
                ])
            ], style={"backgroundColor": "#f8f9fa", "border": "2px solid #ff7f0e", "borderRadius": "10px"}), width=4),
            dbc.Col(dbc.Card([
                dbc.CardBody([
                    html.H5("Net Sales", className="card-title", style={"color": "#000000"}),
                    html.H3(f"${df_metrics['net_sales'][0]:,.2f}", style={"color": "#2ca02c"})
                ])
            ], style={"backgroundColor": "#f8f9fa", "border": "2px solid #2ca02c", "borderRadius": "10px"}), width=4),
        ], className="mb-4"),
        dbc.Row([
            dbc.Col(dbc.Card([
                dbc.CardBody([
                    dcc.Graph(
                        figure=px.line(df_sales_trend, x='order_date', y='total_sales', title='Total Sales Over Time', template="plotly_white", color_discrete_sequence=px.colors.qualitative.Plotly)
                        .update_layout(title={"x": 0.5, "y": 0.95, "xanchor": "center"})
                    )
                ])
            ], style={"border": "2px solid #1f77b4", "borderRadius": "10px"}), width=6),
            dbc.Col(dbc.Card([
                dbc.CardBody([
                    dcc.Graph(
                        figure=px.line(df_profit_margin, x='order_date', y='profit_margin', title='Profit Margin Evolution', template="plotly_white", color_discrete_sequence=px.colors.qualitative.Plotly)
                        .update_layout(title={"x": 0.5, "y": 0.95, "xanchor": "center"})
                    )
                ])
            ], style={"border": "2px solid #ff7f0e", "borderRadius": "10px"}), width=6),
        ])
    ])

def products_layout():
    # Queries
    query_top_products = """
    SELECT dp.product_name, SUM(fo.quantity) AS total_quantity, SUM(fo.total_price) AS total_revenue
    FROM fact_orders fo
    JOIN dim_products dp ON fo.product_id = dp.product_id
    GROUP BY dp.product_name ORDER BY total_revenue DESC LIMIT 10;
    """
    query_sales_by_category = """
    SELECT dp.category_id, SUM(fo.total_price) AS sales
    FROM fact_orders fo
    JOIN dim_products dp ON fo.product_id = dp.product_id
    GROUP BY dp.category_id;
    """
    query_supplier_performance = """
    SELECT ds.supplier_name, SUM(fo.total_price) AS supplier_sales
    FROM fact_orders fo
    JOIN dim_products dp ON fo.product_id = dp.product_id
    JOIN dim_suppliers ds ON dp.supplier_id = ds.supplier_id
    GROUP BY ds.supplier_name ORDER BY supplier_sales DESC LIMIT 5;
    """

    # Fetch data
    df_top_products = fetch_data(query_top_products)
    df_sales_by_category = fetch_data(query_sales_by_category)
    df_supplier_perf = fetch_data(query_supplier_performance)

    # Layout
    return html.Div([
        html.H2("📦 Products Analysis", style={
            "textAlign": "center",
            "color": "#2c3e50",
            "fontSize": "2.5rem",
            "fontWeight": "bold",
            "marginBottom": "20px",
            "padding": "10px",
            "background": "linear-gradient(90deg, #1f77b4, #ff7f0e, #2ca02c)",
            "WebkitBackgroundClip": "text",
            "WebkitTextFillColor": "transparent",
            "borderBottom": "3px solid #1f77b4",
            "display": "inline-block"
        }),
        dbc.Row([
            dbc.Col(dbc.Card([
                dbc.CardBody([
                    dcc.Graph(
                        figure=px.bar(df_top_products, x='product_name', y='total_revenue', title='Top 10 Products by Revenue', template="plotly_white", color_discrete_sequence=px.colors.qualitative.Plotly)
                        .update_layout(title={"x": 0.5, "y": 0.95, "xanchor": "center"})
                    )
                ])
            ], style={"border": "2px solid #1f77b4", "borderRadius": "10px"}), width=6),
            dbc.Col(dbc.Card([
                dbc.CardBody([
                    dcc.Graph(
                        figure=px.bar(df_sales_by_category, x='category_id', y='sales', title='Sales by Product Category', template="plotly_white", color_discrete_sequence=px.colors.qualitative.Plotly)
                        .update_layout(title={"x": 0.5, "y": 0.95, "xanchor": "center"})
                    )
                ])
            ], style={"border": "2px solid #ff7f0e", "borderRadius": "10px"}), width=6),
        ], className="mb-4"),
        dbc.Row([
            dbc.Col(dbc.Card([
                dbc.CardBody([
                    dcc.Graph(
                        figure=px.pie(df_supplier_perf, names='supplier_name', values='supplier_sales', title='Top Supplier Performance', template="plotly_white", color_discrete_sequence=px.colors.qualitative.Plotly)
                        .update_layout(title={"x": 0.5, "y": 0.95, "xanchor": "center"})
                    )
                ])
            ], style={"border": "2px solid #2ca02c", "borderRadius": "10px"}), width=12),
        ])
    ])

def customers_layout():
    # Queries
    query_sales_by_region = """
    SELECT dc.region, SUM(fo.total_price) AS sales
    FROM fact_orders fo
    JOIN dim_customers dc ON fo.customer_id = dc.customer_id
    GROUP BY dc.region;
    """
    query_top_customers = """
    SELECT dc.customer_name, SUM(fo.total_price) AS customer_sales
    FROM fact_orders fo
    JOIN dim_customers dc ON fo.customer_id = dc.customer_id
    GROUP BY dc.customer_name ORDER BY customer_sales DESC LIMIT 10;
    """
    query_customer_distribution = """
    SELECT dc.city, COUNT(*) AS number_of_customers
    FROM dim_customers dc
    GROUP BY dc.city ORDER BY number_of_customers DESC LIMIT 10;
    """

    # Fetch data
    df_sales_by_region = fetch_data(query_sales_by_region)
    df_top_customers = fetch_data(query_top_customers)
    df_customer_distribution = fetch_data(query_customer_distribution)

    # Layout
    return html.Div([
        html.H2("👥 Customer Analysis", style={
            "textAlign": "center",
            "color": "#2c3e50",
            "fontSize": "2.5rem",
            "fontWeight": "bold",
            "marginBottom": "20px",
            "padding": "10px",
            "background": "linear-gradient(90deg, #1f77b4, #ff7f0e, #2ca02c)",
            "WebkitBackgroundClip": "text",
            "WebkitTextFillColor": "transparent",
            "borderBottom": "3px solid #1f77b4",
            "display": "inline-block"
        }),
        dbc.Row([
            dbc.Col(dbc.Card([
                dbc.CardBody([
                    dcc.Graph(
                        figure=px.bar(df_sales_by_region, x='region', y='sales', title='Sales by Region', template="plotly_white", color_discrete_sequence=px.colors.qualitative.Plotly)
                        .update_layout(title={"x": 0.5, "y": 0.95, "xanchor": "center"})
                    )
                ])
            ], style={"border": "2px solid #1f77b4", "borderRadius": "10px"}), width=6),
            dbc.Col(dbc.Card([
                dbc.CardBody([
                    dcc.Graph(
                        figure=px.bar(df_top_customers, x='customer_name', y='customer_sales', title='Top 10 Customers', template="plotly_white", color_discrete_sequence=px.colors.qualitative.Plotly)
                        .update_layout(title={"x": 0.5, "y": 0.95, "xanchor": "center"})
                    )
                ])
            ], style={"border": "2px solid #ff7f0e", "borderRadius": "10px"}), width=6),
        ], className="mb-4"),
        dbc.Row([
            dbc.Col(dbc.Card([
                dbc.CardBody([
                    dcc.Graph(
                        figure=px.pie(df_customer_distribution, names='city', values='number_of_customers', title='Customer Distribution by City', template="plotly_white", color_discrete_sequence=px.colors.qualitative.Plotly)
                        .update_layout(title={"x": 0.5, "y": 0.95, "xanchor": "center"})
                    )
                ])
            ], style={"border": "2px solid #2ca02c", "borderRadius": "10px"}), width=12),
        ])
    ])

def employees_shippers_layout():
    # Queries
    query_sales_by_employee = """
    SELECT de.full_name, SUM(fo.total_price) AS sales
    FROM fact_orders fo
    JOIN dim_employees de ON fo.employee_id = de.employee_id
    GROUP BY de.full_name;
    """
    query_shipping_analysis = """
    SELECT ds.shipper_name, COUNT(*) AS number_of_shipments
    FROM fact_orders fo
    JOIN dim_shippers ds ON fo.shipper_id = ds.shipper_id
    GROUP BY ds.shipper_name;
    """

    # Fetch data
    df_sales_by_employee = fetch_data(query_sales_by_employee)
    df_shipping_analysis = fetch_data(query_shipping_analysis)

    # Layout
    return html.Div([
        html.H2("🏢 Employees & Shippers", style={
            "textAlign": "center",
            "color": "#2c3e50",
            "fontSize": "2.5rem",
            "fontWeight": "bold",
            "marginBottom": "20px",
            "padding": "10px",
            "background": "linear-gradient(90deg, #1f77b4, #ff7f0e, #2ca02c)",
            "WebkitBackgroundClip": "text",
            "WebkitTextFillColor": "transparent",
            "borderBottom": "3px solid #1f77b4",
            "display": "inline-block"
        }),
        dbc.Row([
            dbc.Col(dbc.Card([
                dbc.CardBody([
                    dcc.Graph(
                        figure=px.bar(df_sales_by_employee, x='full_name', y='sales', title='Sales by Employee', template="plotly_white", color_discrete_sequence=px.colors.qualitative.Plotly)
                        .update_layout(title={"x": 0.5, "y": 0.95, "xanchor": "center"})
                    )
                ])
            ], style={"border": "2px solid #1f77b4", "borderRadius": "10px"}), width=6),
            dbc.Col(dbc.Card([
                dbc.CardBody([
                    dcc.Graph(
                        figure=px.bar(df_shipping_analysis, x='shipper_name', y='number_of_shipments', title='Shipping Analysis by Shipper', template="plotly_white", color_discrete_sequence=px.colors.qualitative.Plotly)
                        .update_layout(title={"x": 0.5, "y": 0.95, "xanchor": "center"})
                    )
                ])
            ], style={"border": "2px solid #ff7f0e", "borderRadius": "10px"}), width=6),
        ])
    ])

# Run the app
if __name__ == '__main__':
    app.run_server(debug=True, port=8050)