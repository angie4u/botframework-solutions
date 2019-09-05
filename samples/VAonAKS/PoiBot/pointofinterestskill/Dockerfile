FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
# Set your workdir
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy everything else and build
COPY . ./
RUN rm *.json
RUN dotnet publish -c Release -o out

# build runtime image /aspnet -> ASP.NET /runtime -> .NET Core
FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /app

# Copy from build
COPY --from=build-env /app/out .

# Run your app (dll name has to be changed)
ENTRYPOINT ["dotnet", "PointOfInterestSkill.dll"]