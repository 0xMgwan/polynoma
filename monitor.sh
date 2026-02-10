#!/bin/bash

# Monitor bot performance - tracks trades, win rate, and strategy stats
# Run: bash monitor.sh

echo "🤖 POLYMARKET BOT MONITOR"
echo "=========================="
echo ""

while true; do
  clear
  echo "🤖 POLYMARKET BOT MONITOR - $(date '+%Y-%m-%d %H:%M:%S')"
  echo "=================================================="
  echo ""
  
  # Count trades by type
  echo "📊 TRADE SIGNALS CAPTURED:"
  echo "Smart Money Copies: $(grep -c '\[SIMULATION\] Smart Money Copy' /tmp/bot_output.log 2>/dev/null || echo '0')"
  echo "Arbitrage Signals: $(grep -c 'Arb.*opportunity' /tmp/bot_output.log 2>/dev/null || echo '0')"
  echo "DipArb Signals: $(grep -c 'DipArb.*signal' /tmp/bot_output.log 2>/dev/null || echo '0')"
  echo ""
  
  # Count BUY vs SELL
  echo "📈 SIGNAL BREAKDOWN:"
  echo "BUY Signals: $(grep -c 'BUY' /tmp/bot_output.log 2>/dev/null || echo '0')"
  echo "SELL Signals: $(grep -c 'SELL' /tmp/bot_output.log 2>/dev/null || echo '0')"
  echo ""
  
  # Show recent signals
  echo "🎯 RECENT SIGNALS (Last 10):"
  grep '\[SIMULATION\]' /tmp/bot_output.log 2>/dev/null | tail -10 | sed 's/.*\[SIMULATION\]//' || echo "No signals yet"
  echo ""
  
  echo "Press Ctrl+C to stop monitoring"
  sleep 10
done
