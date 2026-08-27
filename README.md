# DeepSeek-V4-Flash

Docker container for serving **DeepSeek-V4-Flash-0731** on a single **NVIDIA DGX Spark**.

## Requirements

* NVIDIA DGX Spark
* Hugging Face Hub CLI
* Docker with NVIDIA Container Toolkit

## Usage

```bash
git clone https://github.com/C0pyC47/DeepSeek-V4-Flash.git
cd DeepSeek-V4-Flash && make
```

## Endpoint

OpenAI-compatible API on `http://<spark-host>:8000`.

## Credits

* https://github.com/Entrpi/ds4
* https://huggingface.co/antirez/deepseek-v4-gguf
* https://huggingface.co/bleysg/DeepSeek-V4-Flash-DSpark-drafter-GGUF
