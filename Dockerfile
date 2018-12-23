FROM microsoft/dotnet:2.2-sdk as build

COPY . .

RUN dotnet publish -c Release -o ./publish


FROM microsoft/dotnet:2.2-aspnetcore-runtime

COPY --from=build ./publish/ .

ENTRYPOINT ["dotnet", "AncmDemo.dll"]