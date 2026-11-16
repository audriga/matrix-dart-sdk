This fork explores using structured data ([SML](https://datatracker.ietf.org/group/sml/about/)) in matrix events.

For this purpose, types representing these events are added in this fork

See also [our fork of fluffychat](https://github.com/audriga/fluffychat/tree/enable-sml) for rendering these events


# Variants
We internally discussed multiple variants of structured data in matrix messages/ events. Two of these we implemented here

## Custom Event Type

This is built upon the extensible events proposal ([MSC1767](https://github.com/matrix-org/matrix-spec-proposals/pull/1767))

We use a custom event-tpe of `org.sml`, respecitvely `org.matrix.msc9999.sml` (MSC9999 as a placeholder, since we have not created an MSC yet)
Here, the structured data is in the property `org.sml` or `org.matrix.msc9999.sml`, and the fallback text is in `org.matrix.msc1767.text`.

## Custom Message Type 

This approach uses an event of type `m.room.message`, with a custom message type of `m.sml`.

The structured data is contained in `formatted_body`, and the format is set to `json-ld`. 

We used this approach since the fallback text always showed up on unmodified clients.
However, we will likely remove this approach since it is somewhat "hacky".