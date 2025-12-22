#!/bin/bash
# ===========================================
# Secret Generator for Supabase + n8n Stack
# ===========================================

echo "Generating secure secrets..."
echo ""

# Generate secrets
POSTGRES_PASSWORD=$(openssl rand -base64 24 | tr -d '/+=' | cut -c1-32)
JWT_SECRET=$(openssl rand -base64 32)
N8N_ENCRYPTION_KEY=$(openssl rand -hex 32)
SECRET_KEY_BASE=$(openssl rand -base64 64 | tr -d '\n')
VAULT_ENC_KEY=$(openssl rand -hex 32)
LOGFLARE_API_KEY=$(openssl rand -base64 32 | tr -d '/+=' | cut -c1-32)
DASHBOARD_PASSWORD=$(openssl rand -base64 16 | tr -d '/+=' | cut -c1-16)

echo "============================================"
echo "GENERATED SECRETS - COPY THESE TO YOUR .env"
echo "============================================"
echo ""
echo "POSTGRES_PASSWORD=$POSTGRES_PASSWORD"
echo ""
echo "JWT_SECRET=$JWT_SECRET"
echo ""
echo "N8N_ENCRYPTION_KEY=$N8N_ENCRYPTION_KEY"
echo ""
echo "SECRET_KEY_BASE=$SECRET_KEY_BASE"
echo ""
echo "VAULT_ENC_KEY=$VAULT_ENC_KEY"
echo ""
echo "LOGFLARE_API_KEY=$LOGFLARE_API_KEY"
echo ""
echo "DASHBOARD_PASSWORD=$DASHBOARD_PASSWORD"
echo ""
echo "============================================"
echo "JWT KEYS - Generate at https://supabase.com/docs/guides/self-hosting#api-keys"
echo "You need to use the JWT_SECRET above to generate:"
echo "  - ANON_KEY (role: anon)"
echo "  - SERVICE_ROLE_KEY (role: service_role)"
echo "============================================"
