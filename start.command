#!/bin/bash
cd "$(dirname "$0")"
PORT=8000
while lsof -i :$PORT > /dev/null 2>&1; do
  PORT=$((PORT + 1))
  if [ $PORT -gt 9000 ]; then
    echo "❌ 无法找到可用端口"
    exit 1
  fi
done
echo "🚀 正在启动服务器..."
echo "📂 服务目录: $(pwd)"
echo ""
echo "✅ 服务已启动！"
echo "🌐 访问地址: http://localhost:$PORT/index.html"
echo ""
echo "⚠️  关闭此窗口将停止服务器"
echo ""
(sleep 1 && open "http://localhost:$PORT/index.html") &
python3 -m http.server $PORT
