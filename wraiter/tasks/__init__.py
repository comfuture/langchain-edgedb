from io import BytesIO
from os import PathLike
from pathlib import Path
from typing import AsyncGenerator
from PyPDF2 import PdfReader


async def extract_pdf(file: PathLike | BytesIO) -> AsyncGenerator[str, None]:
    """Extract text from PDF file."""
    if isinstance(file, BytesIO):
        reader = PdfReader(file)
    else:
        path = Path(file)
        reader = PdfReader(path)

    for page in reader.pages:
        yield page.extract_text()


async def generate_embeddings(text: str) -> list[float]:
    """Generate embeddings from text."""
    return [1.0, 2.0, 3.0]


async def save_document(name: str, content: str, vector: list[float]) -> None:
    """Save document to database."""
    print(f"Document {name} saved to database.")