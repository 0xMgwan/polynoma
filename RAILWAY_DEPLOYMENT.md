# Railway Deployment Guide

## Setup Steps

### 1. Connect GitHub to Railway
- Go to https://railway.app
- Click "New Project" → "Deploy from GitHub"
- Select your repo: `0xMgwan/polynoma`
- Railway will auto-detect the Node.js project

### 2. Set Environment Variables
In Railway dashboard, go to **Variables** and add:

```
POLYMARKET_PRIVATE_KEY=0xYOUR_PRIVATE_KEY_HERE
CAPITAL_USD=50
DRY_RUN=false
ARBITRAGE_ENABLED=true
DIPARB_ENABLED=true
SMARTMONEY_ENABLED=false
TREND_ANALYSIS_ENABLED=true
```

**⚠️ CRITICAL**: Never commit `.env` to GitHub. Only set variables in Railway dashboard.

### 3. Configure Railway Settings
- **Builder**: Nixpacks (auto-detected)
- **Start Command**: `npx tsx bot-with-dashboard.ts`
- **Port**: 3001 (dashboard)
- **Memory**: 512MB minimum
- **Restart Policy**: Always (auto-restart on crash)

### 4. Deploy
- Push to GitHub or click "Deploy" in Railway dashboard
- Monitor logs in Railway → Deploy Logs tab
- Bot should start and show dashboard at `https://your-railway-url.railway.app`

## Troubleshooting

### Logs show "Starting Container" then stop
- Check **Deploy Logs** for error messages
- Verify all environment variables are set
- Ensure `POLYMARKET_PRIVATE_KEY` is correct (starts with `0x`)

### Bot crashes after startup
- Check if USDC.e balance is sufficient
- Verify RPC endpoint is accessible
- Check logs for specific error messages

### Dashboard not accessible
- Railway assigns a public URL automatically
- Check Railway dashboard for the generated URL
- Dashboard runs on port 3001

## Monitoring

Once deployed:
1. Access dashboard at Railway's public URL
2. Monitor bot performance in real-time
3. Check logs for trade execution and errors
4. Set up Railway alerts for crashes

## Cost
- Railway free tier: 500 hours/month (enough for 24/7 bot)
- Paid tier: $5/month for more resources
