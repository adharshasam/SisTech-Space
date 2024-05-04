import streamlit as st
import os

# OpenAI Key (store securely, consider environment variables)
f = open("keys/openai_key.txt", "r")
key = f.readlines()[0]
f.close()
os.environ["OPENAI_API_KEY"] = key

from openai import OpenAI
client = OpenAI()

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

    with st.chat_message("assistant"):
        stream = client.chat.completions.create(
            model=st.session_state["openai_model"],
            messages=[
                {"role": m["role"], "content": m["content"]}
                for m in st.session_state.messages
            ],
            stream=True,
        )
        response = st.write_stream(stream)
    st.session_state.messages.append({"role": "assistant", "content": response})