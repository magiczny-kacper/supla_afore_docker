FROM rust as builder
COPY . .
RUN cargo build --release

FROM debian:bullseye
EXPOSE 8080
COPY --from=builder ./target/release/supla_afore_docker ./supla_afore_docker
CMD ["./supla_afore_docker"]