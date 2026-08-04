GGUF_REPO = antirez/deepseek-v4-gguf
GGUF_FILE = DeepSeek-V4-Flash-IQ2XXS-w2Q2K-AProjQ8-SExpQ8-OutQ8-chat-v2-imatrix-0731.gguf

DSPARK_REPO = bleysg/DeepSeek-V4-Flash-DSpark-drafter-GGUF
DSPARK_FILE = DSpark-drafter-Q2K-Q8-0731.gguf

.PHONY: all setup serve

all: setup serve

setup:
	docker compose build
	hf download $(GGUF_REPO) $(GGUF_FILE) --local-dir ./gguf
	hf download $(DSPARK_REPO) $(DSPARK_FILE) --local-dir ./gguf

serve:
	GGUF_FILE=$(GGUF_FILE) DSPARK_FILE=$(DSPARK_FILE) docker compose up -d
