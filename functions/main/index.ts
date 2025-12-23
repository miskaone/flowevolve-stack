import { serve } from "https://deno.land/std@0.168.0/http/server.ts"

serve(async (req) => {
  const url = new URL(req.url)

  if (url.pathname === "/" || url.pathname === "/health") {
    return new Response(JSON.stringify({ status: "ok" }), {
      headers: { "Content-Type": "application/json" },
      status: 200,
    })
  }

  return new Response(JSON.stringify({ error: "Function not found" }), {
    headers: { "Content-Type": "application/json" },
    status: 404,
  })
})
