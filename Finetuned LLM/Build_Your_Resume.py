import os
import streamlit as st
import sqlite3
from io import StringIO
from langchain_community.embeddings import HuggingFaceEmbeddings

f = open("keys/openai_key.txt", "r")
key = f.readlines()[0]
f.close()
os.environ["OPENAI_API_KEY"] = key

from openai import OpenAI
client = OpenAI()

# Convert database to text 
def dump_to_text(sqlite_file, query):

    # Connect to the SQLite database
    conn = sqlite3.connect('resume.db')
    cursor = conn.cursor()

    # Execute the query
    cursor.execute(query)

    # Fetch all the data
    data = cursor.fetchall()

    # Close the connection
    conn.close()

    # Use StringIO for temporary string creation
    output_string = StringIO()
    for row in data:
        # Encode as bytes for writing to a file stream
        row_str = ','.join(map(str, row)) + '\n'  # Ensure string formatting before encoding
        output_string.write(row_str)

    # Get the value of the StringIO buffer
    output_data = output_string.getvalue()

    # Close the StringIO object
    output_string.close()

    return output_data

@st.cache_resource
def load_embeddings():
    # Equivalent to SentenceTransformerEmbeddings(model_name="all-MiniLM-L6-v2")
    return HuggingFaceEmbeddings(model_name="all-MiniLM-L6-v2")

embeddings = load_embeddings()
file_raw_text = ""

sqlite_file = 'resume.db'
query = 'SELECT * FROM test;'
file_raw_text = dump_to_text(sqlite_file, query)

if "openai_model" not in st.session_state:
    st.session_state["openai_model"] = "gpt-3.5-turbo" # Replace with your preferred model

if "messages" not in st.session_state:
    st.session_state.messages = []

for message in st.session_state.messages:
    with st.chat_message(message["role"]):
        st.markdown(message["content"])

if prompt := st.chat_input("What is up?"):
    st.session_state.messages.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)
    
    context = file_raw_text

    with st.chat_message("assistant"):
      messages = [
          {"role": "system", "content": "You're a helpful assistant"}
      ]
      # Update the messages list to include the context from file_raw_text
      messages.append({"role": "assistant", "content": context})

      stream = client.chat.completions.create(
          model=st.session_state["openai_model"],
          messages=messages,
          stream=True,
      )
      response = st.write_stream(stream)
      st.session_state.messages.append({"role": "assistant", "content": response})