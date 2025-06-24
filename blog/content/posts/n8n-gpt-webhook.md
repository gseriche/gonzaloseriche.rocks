---
title: "Construyendo un Webhook Inteligente con n8n y GPT"
date: 2025-06-24T12:55:54
draft: false
categories: ["n8n", "automation", "openai", "webhook", "chatgpt"]
author: Gonzalo Seriche
tags: ["n8n", "automation", "openai", "webhook", "chatgpt"]
---

Esta semana comencé a construir mi laboratorio de automatización utilizando [n8n](https://n8n.io), una herramienta visual que me permite conectar APIs sin escribir demasiado código.

## 🧩 Flujo: Webhook + OpenAI GPT

- Recibo un `prompt` vía Webhook
- El mensaje se envía a GPT-3.5 Turbo
- Devuelvo una respuesta generada por IA directamente

```bash
curl -X POST http://localhost:5678/webhook-test/gpt \
  -H 'Content-Type: application/json' \
  -d '{"prompt": "¿Cuál es la capital de Francia?"}'
```

### Resultado esperado

```json
{
  "message": "La capital de Francia es París."
}
```

## 📂 Repositorio del proyecto

Todo el flujo está documentado en GitHub:

👉 [Ver repositorio en GitHub](https://github.com/gseriche/n8n-automation-lab)

## 🌦 Próximo desafío

Mi siguiente flujo integrará datos del clima en tiempo real usando [WeatherAPI](https://www.weatherapi.com/) y los resumirá con GPT. Esto me permite combinar datos externos + IA en flujos automatizados útiles para bots, asistentes o reportes.

---

Este laboratorio es parte de mi proceso de especialización como **Data Engineer**, integrando automatización, APIs, cloud y herramientas de inteligencia artificial.

Más avances pronto en este sitio 🚀

*Quieres discutir este proyecto o necesitas ayuda con la implementación? ¡No dudes en contactarme en [GitHub](https://github.com/gseriche) o por [LinkedIn](https://www.linkedin.com/in/gonzaloserichevega)!*
