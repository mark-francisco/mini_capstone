require "http"


response = HTTP.get("http://localhost:3000/api/products").parse
# response = HTTP.get("http://localhost:3000/api/products/2").parse

pp response