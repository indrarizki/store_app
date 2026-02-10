import consumer from "./consumer"

document.addEventListener("turbo:load", () => {

  const roomElement = document.getElementById("room-id")

  if (!roomElement) return

  const roomId = roomElement.dataset.roomId

  console.log("Subscribing to room:", roomId)

  consumer.subscriptions.create(
    { channel: "RoomChannel", room_id: roomId },

    {

      connected() {
        console.log("Connected to RoomChannel")
      },

      received(data) {

        console.log("Received:", data)

        const messages = document.getElementById("messages")

        messages.insertAdjacentHTML(
          "beforeend",
          `<p><strong>${data.user}</strong>: ${data.content}</p>`
        )

      }

    }

  )

})
